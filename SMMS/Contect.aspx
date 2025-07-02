<%@ Page Title="" Language="C#" MasterPageFile="~/SMMS/SMMS.Master" AutoEventWireup="true" CodeBehind="Contect.aspx.cs" Inherits="SuperMarketManagementSystem.SMMS.Contect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>SMMS / Contect</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="Home.aspx" style="color:#fe2626"><i class="fa fa-home" style="font-size:25px;color:#fe2626"></i> Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</div>
		</div>
	<!-- //breadcrumbs -->
	<!-- contact -->
		<div class="about">
			<div class="w3_agileits_contact_grids">
				<div class="col-md-6 w3_agileits_contact_grid_left">
					<div class="agile_map">
						<img src="../images/Super.jpg" style="border:0"></img>
					</div>
					<div class="agileits_w3layouts_map_pos">
						<div class="agileits_w3layouts_map_pos1">
							<h3>Contact Info</h3>
							<p>L/3422, Tripathi Bhavan, Mirzapur</p>
							<ul class="wthree_contact_info_address">
								<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">divyamgabani@gmail.com</a></li>
								<li><i class="fa fa-phone" aria-hidden="true"></i>+(91)9601 292 692</li>
							</ul>
							<div class="w3_agile_social_icons w3_agile_social_icons_contact">
								<ul>
									<li><a href="#" class="icon icon-cube agile_facebook"></a></li>
									<li><a href="#" class="icon icon-cube agile_rss"></a></li>
									<li><a href="#" class="icon icon-cube agile_t"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 w3_agileits_contact_grid_right">
					<h2 class="w3_agile_header">Leave a<span> Message</span></h2>

					<form action="#" method="post">
						<span class="input input--ichiro">
							<input class="input__field input__field--ichiro" type="text" id="input-25" name="Name" placeholder=" " required="" />
							<label class="input__label input__label--ichiro" for="input-25">
								<span class="input__label-content input__label-content--ichiro">Your Name</span>
							</label>
						</span>
						<span class="input input--ichiro">
							<input class="input__field input__field--ichiro" type="email" id="input-26" name="Email" placeholder=" " required="" />
							<label class="input__label input__label--ichiro" for="input-26">
								<span class="input__label-content input__label-content--ichiro">Your Email</span>
							</label>
						</span>
						<textarea name="Message" placeholder="Your message here..." required=""></textarea>
						<input type="submit" value="Submit">
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	<!-- contact -->
</asp:Content>
