<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationBar.ascx.cs" Inherits="Mobitel.OnlineChanelling.Web.Usercontrols.NavigationBar" %>
<div class="navbar">
    <div class="navbar-content">

        <a href="/" class="element"><span></span>Mobitel Online Channelling <sup>Beta</sup></a>
        <span class="element-divider"></span>

        <a class="pull-menu" href="#"></a>
        <ul class="element-menu">
            <li>
                <a class="dropdown-toggle" href="#">Menu</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Views/ContactUs.aspx">Investor Relations</a></li>
                    <li><a href="Views/ContactUs.aspx">Channel History</a></li>
                    <li><a href="Views/ContactUs.aspx">Partners</a></li>
                    <li><a href="Views/ContactUs.aspx">Company</a></li>
                    <li><a href="Views/ContactUs.aspx">Careers</a></li>
                    <li><a href="Views/ContactUs.aspx">Member Home</a></li>
                    <li><a href="Views/ContactUs.aspx">Contact Us</a></li>
                </ul>
            </li>
        </ul>

        <div class="no-tablet-portrait">
            <span class="element-divider"></span>
            <a class="element brand" href="#"><span class="icon-spin"></span></a>
            <a class="element brand" href="#"><span class="icon-printer"></span></a>
            <span class="element-divider"></span>

            <div class="element input-element">
                <form>
                    <div class="input-control text">
                        <input type="text" placeholder="Search...">
                        <button class="btn-search"></button>
                    </div>
                </form>
            </div>

            <div class="element place-right">
                <a class="dropdown-toggle" href="#"><span class="icon-cog"></span></a>
                <ul class="dropdown-menu place-right" data-role="dropdown">
                    <li><a href="#">Settings</a></li>
                    <li><a href="#">Log Out</a></li>
                </ul>
            </div>
            <span class="element-divider place-right"></span>
            <button class="element image-button image-left place-right">
                Brian Perera
                            <img src="images/icon-user-default.png">
            </button>
        </div>
    </div>
</div>
