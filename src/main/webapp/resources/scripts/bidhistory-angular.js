/**
 * angular get, add, delete, update user
 */

var app = angular.module("myApp", []);

app.controller("auctionCtrl", function(){
	
});

/*app.controller("myCtrl", [
		'$scope',
		'$http',
		'$timeout',
		'datetime',
		function($scope, $http, $timeout, datetime) {
			var getAuctionItems = function(id) {

				$http({
					url : '/rest/auction/bid/' + id,
					method : 'GET'
				}).then(function(response) {
					d = response.data.DATA;
					
					data = [ {
						"Name" : d.product.product_name,
						"NumberOfBids" : d.num_bid,
						"CurrentBid" : d.bid_current_price,
						"AuctionEndDateTime" : d.end_date
					} ];
					
					 * , { "Name" : "ទូរស័ព្ទ IPhone ៧", "NumberOfBids" : 1000,
					 * "CurrentBid" : 999, "AuctionEndDateTime" : "2016-08-20
					 * 07:50:50" }
					 
					// ];
					processAuctionItems(data);
					//
					$scope.auctions = data;

				});

			};

			var tick = function() {
				$scope.currentTime = moment();
				processAuctionItems($scope.auctions);
				$timeout(tick, 1000);
			}

			var processAuctionItems = function(data) {
				angular.forEach(data, function(item) {
					item.remainingTime = datetime
							.getRemainigTime(item.AuctionEndDateTime);
				});
			}

			$scope.currentTime = moment();

			// getAuctionItems();
			getAuctionItems(1); // test

			$timeout(tick, 1000);

			// $timeout(getAuctionItems, 10000);

		} ]);

app.factory('datetime', [ '$timeout', function($timeout) {
	var duration = function(timeSpan) {
		var days = Math.floor(timeSpan / 86400000);
		var diff = timeSpan - days * 86400000;
		var hours = Math.floor(diff / 3600000);
		diff = diff - hours * 3600000;

		var minutes = Math.floor(diff / 60000);
		diff = diff - minutes * 60000;

		var secs = Math.floor(diff / 1000);

		return {
			'days' : days,
			'hours' : hours,
			'minutes' : minutes,
			'seconds' : secs
		};
	};

	function getRemainigTime(referenceTime) {
		var now = moment().utc();
		return moment(referenceTime) - now;
	}

	return {
		duration : duration,
		getRemainigTime : getRemainigTime
	};
} ]);

app.filter('durationview', [
		'datetime',
		function(datetime) {
			return function(input, css) {
				var duration = datetime.duration(input);
				return duration.days + " ថ្ងៃ:" + duration.hours + " ម៉ោង:"
						+ duration.minutes + " នាទី:" + duration.seconds
						+ " វិនាទី";
			};
		} ]);
*/

// TODO: =========BID HISTORY FOR BACK-END============
app.controller('bidHistory', function($scope,$http){
	
	// select all record to display
	$scope.findAllBidHistory = function(){
		$http({
			url: '/rest/bidhistory',
			method: 'GET',
			
		}).then(function(respone){
			$scope.bidHistory = respone.data.DATA;
		});
	}
	
	$scope.findAllBidHistory();
})

// TODO: =========BID HISTORY BY USER_ID FOR FRONT-END============
app.controller('userBidHistory',['$scope', '$http', '$timeout', 'datetime', function ($scope, $http, $timeout, datetime, $rootScope){
	
	// Show or Hide Panel
	$scope.controlPanel = function(){
        $scope.credit = 'true';
       
     }
	
	// select Bid History By UserName to display
	$scope.findBidByUserId = function(user_id){
		
		$http({
			url: '/rest/bidhistory/' + user_id,
		}).then(function(response){
			$scope.userBidHistory = response.data.DATA;
			$scope.processAuctionItems($scope.userBidHistory);
		});
	}
	
	/*checkout*/
	$scope.checkOut = function(item){
		onInvoice();
		$('#created-date').html(item.auction.end_date);
		$('#item-name').html(item.auction.product.product_name);
		$('#unit-price').html(item.auction.current_price);
		$('#total-price').html(item.auction.current_price);
		$('#sub-total').html(item.auction.current_price);
		$('#total').html(item.auction.current_price);
		$('#address').html(item.user.address);
	}

    /*$scope.tick = function () {
        $scope.currentTime = moment();
        $scope.processAuctionItems($scope.userBidHistory);
        $timeout($scope.tick, 1000);
    }
    
    $scope.processAuctionItems = function (data) {
        data.remainingTime = datetime.getRemainigTime(data.auction.end_date);
    }
    
    $timeout($scope.tick, 1000);
    $timeout($scope.userBidHistory, 10000);
	$scope.currentTime = moment();*/ 
	
	$scope.findBidByUserId(USER_ID);
		
}]);


// find remaining date/time
/*
app.factory('datetime', ['$timeout', function ($timeout) {
	
    var duration = function (timeSpan) {
        var days = Math.floor(timeSpan / 86400000);
        var diff = timeSpan - days * 86400000;
        var hours = Math.floor(diff / 3600000);
        diff = diff - hours * 3600000;

        var minutes = Math.floor(diff / 60000);
        diff = diff - minutes * 60000;

        var secs = Math.floor(diff / 1000);

        return { 'days': days, 'hours': hours, 'minutes': minutes, 'seconds': secs };
    };

    function getRemainigTime(referenceTime) {
        var now = moment().utc();
        return moment(referenceTime) - now;
    }
    return {
        duration: duration,
        getRemainigTime: getRemainigTime
    };
}]);

app.filter('durationview', ['datetime', function (datetime) {
    return function (input, css) {
        var duration = datetime.duration(input);
        
        return duration.days + "days, " + duration.hours + "h:" + duration.minutes + "m:" + duration.seconds + "s";
    };
}]);
*/
//==== end find remaining date/time



// viewBidHistory at front-end when user click on bidhistory buttion at bidding interface
app.controller('bidHistoryFrontEndCtrl',['$scope', '$http', '$timeout', 'datetime', function ($scope, $http, $timeout, datetime, $rootScope){
	
	$scope.findBidHistoryByAuctionId = function(auction_id){
		$http({
			url: '/rest/bidhistory/find-num-bid-and-bidder-in-auction-product-by-auc-id/' + 1,
			method: 'GET'
		}).then(function(response){
			$scope.userBidHistory = response.data.DATA;
			//////
			
			/// code here
			
		});
	}
	$scope.findBidHistoryByAuctionId(1);
	
	
	
	//========= remaing time
	// load by auction id
    /*
	$timeout($scope.tick, 1000);
    $timeout($scope.auc_detail, 10000);
	$scope.currentTime = moment();
	*/
	//===================
	
}]);

