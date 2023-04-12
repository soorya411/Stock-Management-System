from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render
from sms.models import *
def mainpg(request):
    return render(request, 'homindex.html')


def logincode(request):
    return render(request, 'loginindex.html')

def logins(request):
    username = request.POST['textfield']
    password = request.POST['textfield2']
    try:
        ob = login.objects.get(username=username, password=password)
        if ob.type == 'admin':
            return HttpResponse('''<script>alert("welcome");window.location='/admin_hom'</script>''')
        elif ob.type == 'distributor':
            request.session['lid']=ob.id
            return  HttpResponse('''<script>alert("welcome");window.location='/dis_hom'</script>''')
        elif ob.type == 'shopowner':
            request.session['lid'] = ob.id
            return  HttpResponse('''<script>alert("welcome");window.location='/shop_hom'</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid username or password");window.location='/logincode'</script>''')
    except:
            return HttpResponse('''<script>alert("Invalid username or password");window.location='/logincode'</script>''')
def update_prod(request,id):
    ob=product.objects.get(id=id)
    request.session['prid']=id
    return render(request, 'edit_delete product.html',{'val':ob})
def update(request):
    try:

        Product_Name = request.POST['textfield']
        Category = request.POST['select']
        Quantity = request.POST['textfield2']
        Tax = request.POST['textfield3']
        Price = request.POST['textfield4']
        image = request.FILES['file']
        fn = FileSystemStorage()
        fs = fn.save(image.name, image)
        iob = product.objects.get(id=request.session['prid'])
        iob.name = Product_Name
        iob.category = Category
        iob.quantity = Quantity
        iob.Tax = Tax
        iob.price = Price
        iob.image = fs
        iob.save()
        return HttpResponse('''<script>alert("update product");window.location='/prd_list'</script>''')
    except:
        Product_Name = request.POST['textfield']
        Category = request.POST['select']
        Quantity = request.POST['textfield2']
        Tax = request.POST['textfield3']
        Price = request.POST['textfield4']

        iob = product.objects.get(id=request.session['prid'])
        iob.name = Product_Name
        iob.category = Category
        iob.quantity = Quantity
        iob.Tax = Tax
        iob.price = Price

        iob.save()
        return HttpResponse('''<script>alert("update product");window.location='/prd_list'</script>''')


def delete_prod(request,id):
    ob=product.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("product deleted");window.location='/prd_list'</script>''')
def add_prod(request):
    return render(request, 'add product.html')

def prdct(request):
    Product_Name  = request.POST['textfield']  
    Category = request.POST['select']
    Quantity = request.POST['textfield2']
    Tax = request.POST['textfield3']
    Price = request.POST['textfield4']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name,image)
    iob = product()
    iob.name=Product_Name
    iob.category=Category
    iob.quantity=Quantity
    iob.Tax=Tax
    iob.price=Price
    iob.image=fs
    iob.save()
    return HttpResponse('''<script>alert("product added");window.location='/prd_list'</script>''')
def ctgry(request):
    return render(request, 'category.html')
    
def dis_reg(request):
    return render(request, 'reg distributor index.html')
def disbtr(request):
    Name = request.POST['textfield']
    Place = request.POST['textfield2']
    Email = request.POST['textfield3']
    Mobile = request.POST['textfield4']
    username = request.POST['textfield5']
    password = request.POST['textfield6']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name,image)
    ob = login()
    ob.username=username
    ob.password=password
    ob.type = 'pending'
    ob.save()
    iob = dis_registration()
    iob.name=Name
    iob.location=Place
    iob.mobile_number=Mobile
    iob.email=Email
    iob.lid=ob
    iob.image=fs
    iob.save()
    return HttpResponse('''<script>alert("successfully registered!");window.location='/dis_hom'</script>''')

def accept(request,id):
    ob=login.objects.get(id=id)
    ob.type='distributor'
    ob.save()
    return HttpResponse('''<script>alert("successfully accepted!");window.location='/view_dis'</script>''')

def reject(request,id):
    ob=login.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("successfully rejected!");window.location='/view_dis'</script>''')    

def admin_hom(request):
    return render(request, 'adminhomeindex.html')
def bill_pg(request):
    return render(request, 'bill.html')

def complt_pg(request):
    ob=complaints.objects.all()
    return render(request, 'complaint.html',{'val':ob})

def dis_hom(request):
    return render(request, 'dis home page.html')
def feedb_pg(request):

    ob=feedback.objects.all()
    return  render(request, 'feedback form.html',{'val':ob})
def fdbk(request):
    Feedback  = request.POST['textarea']
    obb=feedback()
    obb.date=datetime.today()

    obb.feedback=Feedback
    obb.sid=shop_registration.objects.get(lid__id=request.session['lid'])
    obb.save()
    return HttpResponse('''<script>alert("feedback added!");window.location='/feedb_pg '</script>''')
def mng_shop(request):
    ob=shop_product.objects.all()
    return render(request, 'manage shop product.html',{'val':ob})

def odr_pg(request):
    return  render(request, 'order.html')
def prd_list(request):
    ob=product.objects.filter(did__lid__id=request.session['lid'])
    return render(request, 'product list.html',{'val':ob})
    
# def edit(request):
#     return HttpResponse('''<script>alert("editing completed!");window.location='/product'</script>''')
# def delete(request):
    ob.reply=replys
    ob.save()
    return HttpResponse('''<script>alert("reply success!");window.location='/complt_pg'</script>''')
# def rpt(request):
#     return HttpResponse('''<script>alert("successfully deleted!");window.location='/product'</script>''')
def rply_pg(request,id):
    request.session['cid']=id
    return render(request, 'reply form.html')

def sendreply(request):
    replys=request.POST['textfield']  
    ob=complaints.objects.get(id=request.session['cid'])
    return render(request, 'report.html')
def retn(request):
    return render(request, 'return.html')
def sale_list(request):
    return  render(request, 'sales list.html')
def send_fb(request):
    return  render(request, 'sendfeedback.html')
def shop_hom(request):
    return render(request, 'shophomeindex.html')
def shop_reg(request):

    return render(request, 'reg shop index.html')
   

def shpownr(request):
    name = request.POST['textfield']
    location = request.POST['textfield2']
    email = request.POST['textfield3']
    mobile = request.POST['textfield4']
    username = request.POST['textfield5']
    password = request.POST['textfield6']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name, image)
    ob = login()
    ob.username = username
    ob.password = password
    ob.type = 'pending'
    ob.save()
    iob = shop_registration()
    iob.name = name
    iob.location = location
    iob.email = email
    iob.mobile_number = mobile
    iob.lid = ob
    iob.image = fs
    iob.save()
    return HttpResponse('''<script>alert("successfully registered!");window.location='/'</script>''')

def acceptshop(request,id):
    ob=login.objects.get(id=id)
    ob.type='shopowner'
    ob.save()
    return HttpResponse('''<script>alert("successfully accepted!");window.location='/view_shop'</script>''')

def rejectshop(request,id):
    ob=login.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("successfully rejected!");window.location='/view_shop'</script>''')

def shop_add_prd(request):
    ob = shop_product.objects.all()
    return render(request, 'shop add product.html',{'val':ob})
def shop_prd(request):
    Product_Name  = request.POST['textfield']
    Category = request.POST['select']
    Quantity = request.POST['textfield2']
    Tax = request.POST['textfield3']
    Price = request.POST['textfield4']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name,image)
    iob = shop_product()
    iob.name=Product_Name
    iob.category=Category
    iob.quantity=Quantity
    iob.Tax=Tax
    iob.price=Price
    iob.image=fs
    iob.save()
    return HttpResponse('''<script>alert("product added");window.location='/mng_shop'</script>''')
def shop_list(request):
    ob=shop_registration.objects.all()
    return render(request, 'shoplist view.html',{'val':ob})
def view_dis(request):
    ob=dis_registration.objects.all()
    return render(request, 'view distributor list.html',{'val':ob})

def view_shop(request):
    ob=shop_registration.objects.all()
    return render(request, 'view shop list.html',{'val':ob})
def rpt(request):
    return render(request, 'report.html')
def shoprpt(request):
    return render(request, 'shopreport.html')
def viewodr(request):
    ob=order.objects.all()
    return render(request, 'vieworders.html',{'val':ob})
# Create your views here.

