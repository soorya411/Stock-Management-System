from unicodedata import category

from django.db import models

# Create your models here.
class login(models.Model):
    username = models.CharField(max_length=90)
    password = models.CharField(max_length=90)
    type = models.CharField(max_length=90)

class dis_registration(models.Model):
   name = models.CharField(max_length=90)
   location = models.CharField(max_length=90)
   mobile_number = models.BigIntegerField()
   email = models.CharField(max_length=90)
   image = models.FileField()
   lid = models.ForeignKey(login,on_delete=models.CASCADE)

class shop_registration(models.Model):
    name = models.CharField(max_length=90)
    location = models.CharField(max_length=90)
    email = models.CharField(max_length=90)
    mobile_number = models.BigIntegerField()
    image = models.FileField()
    lid = models.ForeignKey(login, on_delete=models.CASCADE)

class complaints(models.Model):
    lid = models.ForeignKey(shop_registration, on_delete=models.CASCADE)
    did = models.ForeignKey(dis_registration, on_delete=models.CASCADE)
    date=models.DateField()
    complaint=models.CharField(max_length=300)
    reply=models.CharField(max_length=90)

class feedback(models.Model):
    sid = models.ForeignKey(shop_registration, on_delete=models.CASCADE)
    feedback = models.CharField(max_length=100)
    date = models.DateField()

class category(models.Model):
    category_name = models.CharField(max_length=100)
    GST = models.CharField(max_length=100)
    discription = models.CharField(max_length=100)

class product(models.Model):
    name = models.CharField(max_length=100)
    quantity = models.CharField(max_length=90)
    price = models.IntegerField()
    MRP = models.IntegerField()
    stock = models.IntegerField()
    image = models.FileField()
    did = models.ForeignKey(dis_registration, on_delete=models.CASCADE)
    cid = models.ForeignKey(category, on_delete=models.CASCADE)

class shop_product(models.Model):
    name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    quantity = models.CharField(max_length=90)
    MRP = models.IntegerField()
    Tax = models.CharField(max_length=50)
    image = models.FileField()

class order(models.Model):
    date = models.DateField()
    pid = models.ForeignKey(product, on_delete=models.CASCADE)
    sid = models.ForeignKey(shop_registration, on_delete=models.CASCADE)
    orderstatus = models.CharField(max_length=100)
    stock = models.CharField(max_length=100)
    amt=models.CharField(max_length=1000)

class returnlist(models.Model):
    oid = models.ForeignKey(order, on_delete=models.CASCADE)
    date = models.DateField()
    status = models.CharField(max_length=100)
    reason=models.TextField()

class bill(models.Model):
    sid = models.ForeignKey(shop_registration, on_delete=models.CASCADE)
    date = models.DateField()
    total_amount = models.IntegerField()
    status = models.CharField(max_length=100)

class billdetails(models.Model):
    bid = models.ForeignKey(bill, on_delete=models.CASCADE)
    pid = models.ForeignKey(order, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
