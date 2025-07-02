<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/SMMS.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Customer.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SMMS / Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- main-slider -->
		<ul id="demo1">
			<li>
				<img src="../../images/11.jpg" alt="" />
				<!--Slider Description example-->
				<div class="slide-desc">
					<h3>Buy Rice Products Are Now On Line With Us</h3>
				</div>
			</li>
			<li>
				<img src="../../images/22.jpg" alt="" />
				  <div class="slide-desc">
					<h3>Whole Spices Products Are Now On Line With Us</h3>
				</div>
			</li>
			
			<li>
				<img src="../../images/44.jpg" alt="" />
				<div class="slide-desc">
					<h3>Now, You Can Shop With Your Choice</h3>
				</div>
			</li>
		</ul>
	<!-- //main-slider -->
	<br />
	<!-- Indicators -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<a href="#"> <img class="first-slide" src="../images/b1.jpg" alt="First slide" style="display: block; margin: 0 auto; width: 100%;"></a>
			</div>
			<div class="item">
				<a href="#"> <img class="second-slide " src="../../images/b3.jpg" alt="Second slide" style="display: block; margin: 0 auto; width: 100%;"></a>
			</div>
			<div class="item">
				<a href="#"><img class="third-slide " src="../../images/b1.jpg" alt="Third slide" style="display: block; margin: 0 auto; width: 100%;"></a>
			</div>
		</div>
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
    </div>
	<!-- /.carousel -->	

	<!--banner-bottom-->
		<div class="ban-bottom-w3l">
			<div class="container">
				<div class="col-md-6 ban-bottom3">
					<div class="ban-top">
						<img src="../../images/p2.jpg" class="img-responsive" alt=""/>
					</div>
					<div class="ban-img">
						<div class=" ban-bottom1">
							<div class="ban-top">
								<img src="../../images/p3.jpg" class="img-responsive" alt=""/>
							</div>
						</div>
						<div class="ban-bottom2">
							<div class="ban-top">
								<img src="../../images/p4.jpg" class="img-responsive" alt=""/>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 ban-bottom">
					<div class="ban-top">
						<img src="../../images/111.jpg" class="img-responsive" alt=""/>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
<!--banner-bottom-->


	<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('#demo1').skdslider({'delay':4000, 'animationSpeed': 1500,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
					
			jQuery('#responsive').change(function(){
				$('#responsive_wrapper').width(jQuery(this).val());
			});
		
		});
    </script>
</asp:Content>