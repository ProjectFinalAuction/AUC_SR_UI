<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.khmeracademy.auction.entities.User"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="cambodia_auction"></spring:message></title>
<!-- header -->
<jsp:include page="header.jsp" />
<!-- menu -->
<jsp:include page="menu.jsp" />
<!-- left content -->
<jsp:include page="left-content.jsp" />
<!-- right content -->
<div class="col-md-9" style="padding: 0;"
	id="right-content">
	
	<!-- ================ Starting New Item Content ================ -->
	<div class="row" style="position: relative;">
		<p id="title"><spring:message code="best_bid"></spring:message></p>
		<!-- ============ thumbnail Section ============= -->
		<div class="col-sm-6 col-md-3 product" style="padding-right: 0px;" ng-repeat="ab in auctionBestBid ">
			<div class="thumbnail" ng-repeat="proimg in ab.product.gallery" ng-show="$first" style="position: relative;">
				<a href="${pageContext.request.contextPath}/detail?gws_rd=cr&{{a.product.category.category_name}}&ei=gGm1VbP-He_aKoTEy&=lovE100%f&Aid={{a.auction_id}}&site=PPvgSov&{{a.product.product_name}}"><img
					src="{{proimg.image_path}}"
					alt="..." class="img-thumbnail" style="height: 180px;"></a>
				<div class="caption descript">
					<a href="${pageContext.request.contextPath}/detail?gws_rd=cr&{{a.product.category.category_name}}&ei=gGm1VbP-He_aKoTEy&=lovE100%f&Aid={{a.auction_id}}&site=PPvgSov&{{a.product.product_name}}" class="title">{{a.product.product_name}}</a>
					<h5 class="lang" key="remaining_day">{{ab.remainingTime | durationview}}</h5>
					<p>
						<span class="price" style="margin-right:20px;">{{ab.current_price | currency}}</span>{{ab.num_bid}} <spring:message code="bids"></spring:message></span>
					</p>
					<p class="text-center">
						<a href="${pageContext.request.contextPath}/detail?gws_rd=cr&{{a.product.category.category_name}}&ei=gGm1VbP-He_aKoTEy&=lovE100%f&Aid={{a.auction_id}}&site=PPvgSov&{{a.product.product_name}}"
						 class="btn btn-default"
							role="button"><font color="black">
							<i class="fa fa-gavel" aria-hidden="true"></i> <spring:message code="bid_now"></spring:message></font> </a>
					</p>
				</div>
			</div>
		</div>
	</div> <!-- ============ End Row 2 Section ============= -->
	
	<!-- Pagination-->
	<div class="col-sm-12">
		<div id="PAGINATION" class="pull-right"></div>
	</div>
	<!-- End Pagination-->
	
	
</div> <!-- ============ End col-md-9 Section ============= -->
	
<!-- footer -->
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/angular-filter.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/scripts/best-bid-anglular.js"></script>