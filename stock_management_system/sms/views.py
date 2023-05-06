from datetime import datetime
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import redirect
from django.shortcuts import render
from sms.models import *
def mainpg(request):
    return render(request, 'homindex.html')
def logout(request):
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
    obb=category.objects.all()
    return render(request, 'edit_delete product.html',{'val':ob,'v':obb})
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
        iob.cid = category.objects.get(id=Category)
        iob.quantity = Quantity
        iob.Tax = Tax
        iob.price = Price
        iob.image = fs
        iob.save()
        return HttpResponse('''<script>alert("update product");window.location='/prd_list'</script>''')
    except:
        Product_Name = request.POST['textfield']
        Quantity = request.POST['textfield2']
        Tax = request.POST['textfield3']
        Price = request.POST['textfield4']
        Category = request.POST['select']
        print(Category,"+++++++++++++++++++")
        iob = product.objects.get(id=request.session['prid'])
        iob.name = Product_Name
        iob.cid = category.objects.get(id=Category)
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
    ob = category.objects.all()
    return render(request, 'add product.html',{'val':ob})
def prdct(request):
    Product_Name  = request.POST['textfield']  
    Category = request.POST['select']
    Quantity = request.POST['textfield2']
    MRP = request.POST['textfield3']
    Price = request.POST['textfield4']
    Stock  = request.POST['textfield5']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name,image)
    iob = product()
    iob.name=Product_Name
    iob.did=dis_registration.objects.get(lid__id=request.session['lid'])
    iob.cid=category.objects.get(id=Category)
    iob.quantity=Quantity
    iob.MRP=MRP
    iob.price=Price
    iob.stock=Stock
    iob.image=fs
    iob.save()
    return HttpResponse('''<script>alert("product added");window.location='/prd_list'</script>''')
def ctgry(request):
    return render(request, 'category.html')
def addcat(request):
    Category_name = request.POST['textfield']
    GST = request.POST['textfield2']
    Discription = request.POST['textarea']
    iob=category()
    iob.category_name = Category_name
    iob.GST = GST
    iob.discription = Discription
    iob.save()
    return HttpResponse('''<script>alert("category added");window.location='/cat_list'</script>''')
def cat_list(request):
    ob=category.objects.all()
    return render(request, 'view category.html',{'val':ob})



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
    return render(request, 'admin home page.html')
def bill_pg(request):
    ob=bill.objects.filter(sid__lid__id=request.session['lid'])
    return render(request, 'bill.html',{'val':ob})
def bill_pg2(request,id):
    ob=billdetails.objects.filter(bid__id=id)
    return render(request, 'bill2.html',{'val':ob})
def complt_pg(request):
    ob=complaints.objects.all()
    return render(request, 'distributor complaint.html',{'val':ob})
def complt_pg1(request):
    ob=complaints.objects.all()
    return render(request, 'complaint.html',{'val':ob})
def cmplt(request):
    ob=dis_registration.objects.all()
    return render(request, 'add complaint.html',{'val':ob})
def addcmplt(request):
    dis = request.POST['select']
    complaint = request.POST['textarea']
    ob=complaints()
    ob.did=dis_registration.objects.get(id=dis)
    ob.lid=shop_registration.objects.get(lid__id=request.session['lid'])
    ob.complaint=complaint
    ob.date=datetime.today()
    ob.reply='pending'
    ob.save()
    return HttpResponse('''<script>alert("complaint added");window.location='/shop_hom'</script>''')
def viewreply(request):
    ob=complaints.objects.filter(lid__lid__id=request.session['lid'])

    return render(request, 'view reply.html',{'val':ob})
def dis_hom(request):
    ob=dis_registration.objects.get(lid__id=request.session['lid'])
    request.session['name']=ob.name
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
    return HttpResponse('''<script>alert("feedback added!");window.location='/shop_hom'</script>''')
def mng_shop(request):
    ob=dis_registration.objects.all()
    return render(request, 'shoporder.html',{'val':ob})

def user_order1(request):
    ob = category.objects.all()
    return render(request, 'userorder.html', {'val': ob})
def user_order2(request):
    ob = category.objects.all()
    cat=request.POST['select']
    ob1=order.objects.filter(pid__cid__id=cat,orderstatus='accept',sid__lid__id=request.session['lid'])
    return render(request, 'userorder.html', {'val': ob,'v':ob1,'c':int(cat)})
def user_order3(request,id):
    request.session['pid']=id
    ob1=order.objects.get(id=id)
    return render(request, 'nxt.html', {'i':ob1})
def order_info(request):
    btn=request.POST['button']
    qty=request.POST['qty']
    from django.db.models import Max
    cqty=order.objects.get(id=request.session['pid'])
    # cqty.stock = int(cqty.stock) - int(qty)
    if int(cqty.stock) > int(qty):
        if btn == "NEXT":
            bb = bill.objects.filter(status='pending',sid__lid__id=request.session['lid']).aggregate(max=Max('id'))
            print(bb,"=================")
            if bb['max'] is None:
                ob=bill()
                ob.sid=shop_registration.objects.get(lid__id=request.session['lid'])
                ob.total_amount='0'
                ob.date=datetime.today()
                ob.status='pending'
                ob.save()
                ob1=billdetails()
                ob1.pid=order.objects.get(id=request.session['pid'])
                ob1.bid=bill.objects.get(id=ob.id)
                ob1.quantity=qty
                ob1.status='ordered'
                ob1.save()
                return redirect('/user_order1')
            else:
                ob1 = billdetails()
                ob1.pid = order.objects.get(id=request.session['pid'])
                ob1.bid = bill.objects.get(id=bb['max'])
                ob1.quantity = qty
                ob1.status = 'ordered'
                ob1.save()
                return redirect('/user_order1')
        else:
            bb = bill.objects.filter(status='pending',sid__lid__id=request.session['lid']).aggregate(max=Max('id'))
            cqty = order.objects.get(id=request.session['pid'])
            cqty.stock = int(cqty.stock) - int(qty)
            cqty.save()
            if bb['max'] is None:
                ob=bill()
                ob.sid=shop_registration.objects.get(lid__id=request.session['lid'])
                ob.total_amount='0'
                ob.date=datetime.today()
                ob.status='pending'
                ob.save()
                ob1=billdetails()
                ob1.pid=order.objects.get(id=request.session['pid'])
                ob1.bid=bill.objects.get(id=ob.id)
                ob1.quantity=qty
                ob1.status='ordered'
                ob1.save()
                aa = bill.objects.get(id=ob.id)
                s = billdetails.objects.filter(bid__id=ob.id)
                gob = billdetails.objects.filter(bid__id=ob.id).values('pid__pid__cid').distinct()
                print(gob, "$$$$$$$$$$$$$$$$$$$$")
                gst = 0
                for k in gob:
                    qp = category.objects.get(id=k['pid__pid__cid'])
                    gst = gst + int(qp.GST)
                print(gst, "ggggsssssssssssssssssttttttttttttttttttt")
                tot = 0
                for i in s:
                    rs = int(i.quantity) * int(i.pid.pid.MRP)
                    print(rs, "***********")
                    tot = tot + rs
                print(tot, "==================================================")
                request.session['tot'] = tot
                fob = bill.objects.get(id=ob.id)
                fob.total_amount = tot
                fob.save()
                request.session['bill_id'] = ob.id
                gtot=int(tot)*int(gst)/100
                famt=int(tot)+int(gtot)
                print(gtot,famt,"=====================")
                return render(request, 'bill_data.html', {'bid': aa.id, 'val': s, 'tot': tot,'gst':gst,'gtot':famt})
            else:
                ob1 = billdetails()
                ob1.pid = order.objects.get(id=request.session['pid'])
                ob1.bid = bill.objects.get(id=bb['max'])
                ob1.quantity = qty
                ob1.status = 'ordered'
                ob1.save()
                aa = bill.objects.get(id=bb['max'])
                s = billdetails.objects.filter(bid__id=bb['max'])
                gob = billdetails.objects.filter(bid__id=bb['max']).values('pid__pid__cid').distinct()
                print(gob, "$$$$$$$$$$$$$$$$$$$$")
                gst = 0
                for k in gob:
                    qp = category.objects.get(id=k['pid__pid__cid'])
                    gst = gst + int(qp.GST)
                print(gst, "ggggsssssssssssssssssttttttttttttttttttt")
                tot = 0
                for i in s:
                    rs = int(i.quantity) * int(i.pid.pid.MRP)
                    print(rs, "***********")
                    tot = tot + rs
                print(tot, "==================================================")
                request.session['tot'] = tot
                fob = bill.objects.get(id=bb['max'])
                fob.total_amount = tot
                fob.save()
                request.session['bill_id'] = bb['max']
                gtot = int(tot) * int(gst) / 100
                famt = int(tot) + int(gtot)
                print(gtot, famt, "=====================")
                return render(request, 'bill_data.html', {'bid': aa.id, 'val': s, 'tot': tot,'gst':gst,'gtot':famt})
    else:
        return HttpResponse('''<script>alert("Insuficient Quantity!!!");window.location='/paymt'</script>''')
def paymt(request):
    import razorpay
    fob = bill.objects.get(id=request.session['bill_id'])
    fob.status = 'paid'
    fob.save()
    amount = request.session['tot']
    client = razorpay.Client(auth=("rzp_test_edrzdb8Gbx5U5M", "XgwjnFvJQNG6cS7Q13aHKDJj"))
    print(client)
    payment = client.order.create({'amount': str(amount) + "00", 'currency': "INR", 'payment_capture': '1'})
    return render(request,'UserPayProceed.html',{'p':payment})
def on_payment_success(request):
    return HttpResponse('''<script>alert("Success!");window.location="/shop_hom"</script>''')
def searchandviewprdcts(request):
    ob = dis_registration.objects.all()
    dis=request.POST['select']
    obb=product.objects.filter(did__id=dis)
    return render(request, 'shoporder.html', {'val': ob,'val1':obb,'d':int(dis)})
def odr_pg(request,id):
    request.session['prdctid']=id
    return  render(request, 'oorder.html')
def orderproduct(request):
    qty=request.POST['textfield']
    pob=product.objects.get(id=request.session['prdctid'])
    if(int(pob.stock)>int(qty)):
        ob1=order.objects.filter(sid__lid__id=request.session['lid'])
        for i in ob1:
            ob = order.objects.get(id=i.id)
            total = int(ob.stock) * int(ob.pid.price)
            # disnt = int(ob.pid.MRP) - int(ob.pid.price)
            gtot = int(total) * int(ob.pid.cid.GST) / 100
            famt = int(total) + int(gtot)
            if int(famt) <= int(ob.amt):
                ck = 1
            else:
                ck = 0
            print(ck, "============================")
            damt = int(famt) - int(ob.amt)
            print(damt,"======================")
            if(int(damt) > 5000):
                ob = order()
                ob.date = datetime.today()
                ob.pid = product.objects.get(id=request.session['prdctid'])
                ob.sid = shop_registration.objects.get(lid__id=request.session['lid'])
                ob.orderstatus = 'pending'
                ob.stock = qty
                ob.amt = '0'
                ob.save()
                return HttpResponse('''<script>alert("ordered");window.location='/mng_shop'</script>''')
            else:
                return HttpResponse('''<script>alert("Please clear the due amount");window.location='/mng_shop'</script>''')
    else:
        return HttpResponse('''<script>alert("Insufficient quantity");window.location='/mng_shop'</script>''')


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
def prd_list(request):
    ob=product.objects.filter(did__lid__id=request.session['lid'])
    return render(request, 'product list.html',{'val':ob})
def stock_info(request):
    from django.db.models import Sum
    ob = order.objects.filter(sid__lid__id=request.session['lid']).values('pid__name','pid__did__name','pid__price').order_by('pid__id').annotate(sum=Sum('stock'))
    print(ob,"========")
    return render(request,'stock_info.html',{'val':ob})
# def rpt(request):
#     return HttpResponse('''<script>alert("successfully deleted!");window.location='/product'</script>''')
def rply_pg(request,id):
    request.session['cid']=id
    return render(request, 'reply form.html')
def sendreply(request):
    replys=request.POST['textfield']  
    ob=complaints.objects.get(id=request.session['cid'])
    ob.reply=replys
    ob.save()
    return HttpResponse('''<script>alert("reply success!");window.location='/complt_pg'</script>''')
def retn(request):
    ob=order.objects.filter(pid__did__lid__id=request.session['lid'])
    return render(request,'return.html',{'v':ob})
def retn1(request):
    ob = category.objects.all()
    return render(request,'retrnlist.html', {'val': ob})
def returned(request,id):
    ob=order.objects.get(id=id)
    ob.orderstatus='requested'
    ob.save()
    return HttpResponse('''<script>window.location='/retn1'</script>''')
def retn2(request):
    ob = category.objects.all()
    cat = request.POST['select']
    ob1=order.objects.filter(pid__cid__id=cat,sid__lid__id=request.session['lid'])
    return render(request,'retrnlist.html', {'val': ob, 'v': ob1, 'c': int(cat)})
def sale_list(request):
    today=datetime.today()
    ob=bill.objects.filter(date=datetime.today(),sid__lid__id=request.session['lid']).count()
    ob1=bill.objects.filter(sid__lid__id=request.session['lid'],date__month=today.month,date__year=today.year).count()
    print(ob1,"============")
    tob=bill.objects.filter(sid__lid__id=request.session['lid'],date__year=today.year).count()
    a=bill.objects.filter(sid__lid__id=request.session['lid'],date=datetime.today())
    tot=0
    for i in a:
        tot=tot+int(i.total_amount)
    print(tot,"***************")
    s = bill.objects.filter(sid__lid__id=request.session['lid'],date__month=today.month,date__year=today.year)
    mob = 0
    for i in s:
        mob = mob + int(i.total_amount)
    return  render(request,'sales list.html',{'v':ob,'v1':ob1,'c':tob,'tot':tot,'m':mob})
def send_fb(request):
    return  render(request, 'sendfeedback.html')
def shop_hom(request):
    ob = shop_registration.objects.get(lid__id=request.session['lid'])
    request.session['sname'] = ob.name
    import numpy as np
    from django.db.models import Avg,Sum
    ob = order.objects.filter(sid__lid__id=request.session['lid']).values('pid__name', 'pid__did__name',
                                                                          'pid__price').order_by('pid__id').annotate(sum=Sum('stock'))
    print(ob, "========")
    # obb = restaurant.objects.values('rname').annotate(rtg=Avg('rating')).order_by('-rating')
    c = []
    s = []
    for i in ob:
        c.append(i['pid__name'])
        s.append(float(i['sum']))
    print(c)
    print(s)
    return render(request, 'graph.html', {'v': ob, 'c': c, 's': s})
    # return render(request, 'shop home page.html')
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
    MRP = request.POST['textfield4']
    image = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(image.name,image)
    iob = shop_product()
    iob.name=Product_Name
    iob.category=Category
    iob.quantity=Quantity
    iob.Tax=Tax
    iob.MRP=MRP
    iob.image=fs
    iob.save()
    return HttpResponse('''<script>alert("product added");window.location='/mng_shop'</script>''')
def shop_list(request):
    from django.db.models import Count
    ob=order.objects.filter(orderstatus='accept',pid__did__lid__id=request.session['lid']).values('sid__name','sid__location','sid__mobile_number','sid__email').annotate(dcount=Count('sid')).order_by()
    print(ob,"==============")
    return render(request, 'shoplist view.html',{'val':ob})
def view_dis(request):
    ob=dis_registration.objects.all()
    return render(request, 'view distributor list.html',{'val':ob})
def block_or_unblock_dis(request):
    ob=dis_registration.objects.all()
    return render(request, 'unblock distributor.html',{'val':ob})
def block(request,id):
    ob=login.objects.get(id=id)
    ob.type='block'
    ob.save()
    return HttpResponse('''<script>alert("blocked!");window.location='/block_or_unblock_dis'</script>''')

def unblock(request,id):
    ob=login.objects.get(id=id)
    ob.type='distributor'
    ob.save()
    return HttpResponse('''<script>alert("unblocked!");window.location='/block_or_unblock_dis'</script>''')
def view_shop(request):
    ob=shop_registration.objects.all()
    return render(request, 'view shop list.html',{'val':ob})
def block_or_unblock_shop(request):
    ob=shop_registration.objects.all()
    return render(request, 'block shop.html',{'val':ob})
def blockshop(request,id):
    ob=login.objects.get(id=id)
    ob.type='block'
    ob.save()
    return HttpResponse('''<script>alert("blocked!");window.location='/block_or_unblock_shop'</script>''')
def unblockshop(request,id):
    ob=login.objects.get(id=id)
    ob.type='shopowner'
    ob.save()
    return HttpResponse('''<script>alert("unblocked!");window.location='/block_or_unblock_shop'</script>''')
def rpt(request):
    today = datetime.today()
    ob = order.objects.filter(orderstatus='accept',date=datetime.today(), pid__did__lid__id=request.session['lid']).count()
    ob1 = order.objects.filter(orderstatus='accept',pid__did__lid__id=request.session['lid'], date__month=today.month,
                              date__year=today.year).count()
    print(ob, "============")
    tob = order.objects.filter(orderstatus='accept',pid__did__lid__id=request.session['lid'], date__year=today.year).count()
    a = order.objects.filter(orderstatus='accept',pid__did__lid__id=request.session['lid'], date=datetime.today())
    tot = 0
    for i in a:
        tot = tot + int(i.stock)*int(i.pid.price)
    print(tot, "***************")
    s = order.objects.filter(orderstatus='accept',pid__did__lid__id=request.session['lid'], date__month=today.month, date__year=today.year)
    mob = 0
    for i in s:
        mob = mob +int(i.stock)*int(i.pid.price)
    return render(request, 'sales list2.html', {'v': ob, 'v1': ob1, 'c': tob, 'tot': tot, 'm': mob})
def shoprpt(request):
    today = datetime.today()
    ob1 = bill.objects.filter(sid__lid__id=request.session['lid'], date__month=today.month,
                              date__year=today.year).count()
    print(ob1, "============")
    s = bill.objects.filter(sid__lid__id=request.session['lid'],date__month=today.month,date__year=today.year)
    mob = 0
    for i in s:
        mob = mob + int(i.total_amount)
    from django.db.models import Subquery,OuterRef,Count
    # annotation={'AcSum':count('pid')}
    # pd=billdetails.objects.filter(bid__date__month=today.month,bid__date__year=today.year).values('pid').annotate(**annotation).order_by('-AcSum').values('AcSum')[:1]
    pd=billdetails.objects.filter(bid__date__month=today.month,bid__date__year=today.year).values('pid__pid__name','pid__pid__image').annotate(count=Count('pid'))
    try:
        pd=pd.latest('count')
        print(pd,"*************************")
    except:
        return render(request, 'shopreport.html',
                      {'v': ob1, 'm': mob, 'pd': 0, 'cnt': 0, 'im': 0})
    return render(request, 'shopreport.html',{'v':ob1,'m':mob,'pd':pd['pid__pid__name'],'cnt':pd['count'],'im':pd['pid__pid__image']})
def viewodr(request):
    ob=order.objects.filter(pid__did__lid__id=request.session['lid'])
    return render(request, 'vieworders.html',{'val':ob})
def paymnt_1(request,id):
    request.session['oid']=id
    ob=order.objects.get(id=id)
    total=int(ob.stock)*int(ob.pid.price)
    disnt=int(ob.pid.MRP)-int(ob.pid.price)
    gtot = int(total) * int(ob.pid.cid.GST) / 100
    famt = int(total) + int(gtot)
    if int(famt) <= int(ob.amt):
        ck=1
    else:
        ck=0
    print(ck,"============================")
    damt=int(famt)-int(ob.amt)
    return render(request, 'paymnt1.html',{'val':ck ,'tot':int(total),'d':disnt,'gtot':famt,'gst':ob.pid.cid.GST,'pamt':ob.amt,'damt':damt})
def paymnt_2(request):
    amt=request.POST['amt1']
    oid=request.session['oid']
    ob=order.objects.get(id=oid)
    ob.amt=int(ob.amt)+int(amt)
    ob.save()
    total=int(ob.stock)*int(ob.pid.price)
    disnt=int(ob.pid.MRP)-int(ob.pid.price)
    gtot = int(total) * int(ob.pid.cid.GST) / 100
    famt = int(total) + int(gtot)
    if int(famt) <= int(ob.amt):
        ck=1
    else:
        ck=0
    print(ck,"============================")
    damt=int(famt)-int(ob.amt)
    return render(request, 'paymnt1.html',{'val':ck ,'tot':int(total),'d':disnt,'gtot':famt,'gst':ob.pid.cid.GST,'pamt':ob.amt,'damt':damt})

def acceptorder(request,id):
    ob=order.objects.get(id=id)
    ob.orderstatus='accept'
    ob.save()
    ob1=product.objects.get(id=ob.pid.id)
    ob1.stock=int(ob1.stock)-int(ob.stock)
    ob1.save()
    return HttpResponse('''<script>alert("Order accepted!");window.location='/viewodr'</script>''')
def rejectorder(request,id):
    ob=order.objects.get(id=id)
    ob.orderstatus='reject'
    ob.save()
    return HttpResponse('''<script>alert("Order rejected!");window.location='/viewodr'</script>''')
def aprv(request,id):
    ob=order.objects.get(id=id)
    ob.orderstatus='returned'
    ob.save()
    return HttpResponse('''<script>alert("Request accepted!");window.location='/retn'</script>''')
def rjt(request,id):
    ob=order.objects.get(id=id)
    ob.orderstatus='rejected'
    ob.save()
    return HttpResponse('''<script>alert("Request rejected!");window.location='/retn'</script>''')
# Create your views here.

