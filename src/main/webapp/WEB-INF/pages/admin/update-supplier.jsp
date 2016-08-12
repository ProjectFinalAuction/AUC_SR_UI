<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- menu -->
<jsp:include page="menu.jsp"></jsp:include>
<!-- left content -->
<jsp:include page="left-content.jsp"></jsp:include>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- menu -->
<jsp:include page="menu.jsp"></jsp:include>
<!-- left content -->
<jsp:include page="left-content.jsp"></jsp:include>




      <!-- ============================================================== -->
      <!-- Start right Content here -->
      <!-- ============================================================== -->                      
      <div class="content-page">
        <!-- Start content -->
        <div class="content">
          <div class="container">
            <!-- Page-Title -->
            <div class="row">
              <div class="col-sm-12">
                <h4 class="page-title">Supplier Management</h4>
                <ol class="breadcrumb">
                  <li><a href="">iWant Auction</a></li>
                  <li><a href="">Supplier Management</a></li>
                  <li class="active">Add/Edit Supplier</li>
                </ol>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-12">
                <form id="wizard-validation-form" name="myForm" >
                  <div class="row">                    
                    <div class="card-box">
                      <h5 class="text-muted text-uppercase m-t-0 m-b-20"><b>Add Supplier</b></h5>
                      <div class="form-group clearfix">
                        <label  class="col-lg-2" for="contactname">Contact name <span class="text-danger">*</span></label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="contactname" id="contactname" ng-model="contact_name" required>
                        </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-lg-2" for="address">Address<span class="text-danger">*</span></label>
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="address" id="address" ng-model="address" required>
                        </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-lg-2" for="phone">Phone<span class="text-danger">*</span></label>
                        
                        <div class="col-lg-10">
                          <input type="text" class="form-control" name="phone" id="phone" placeholder="ex : 012 99 98 99" ng-model="phone" required>
                        </div>
                      </div>
                      <div class="form-group clearfix">
                        <label class="col-lg-2" for="email">Email<span class="text-danger">*</span></label>
                        <div class="col-lg-10">
                          <input type="email" class="form-control" name="email" id="email" placeholder="ex :example@gmail.com" ng-model="email" required>
                        </div>
                      </div><br/>
                      <div class="row">
                        <div class="col-sm-12">
                          <div class="text-center p-20">
                            <button type="button" class="btn w-sm btn-default waves-effect waves-light"  ng-click="addSupplier()" ng-disabled="myForm.$invalid">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>
                            <button type="button" class="btn w-sm btn-danger waves-effect waves-light"><i class="fa fa-times" aria-hidden="true"></i> Cancel</button>
                          </div>
                        </div>
                      </div>
                    </div> 
                  </div> 
                </form>
              </div>
            </div> 
          </div><!-- container -->
        </div><!-- content -->



<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/scripts/supplier-angular.js"></script>
	<!--wizard initialization-->