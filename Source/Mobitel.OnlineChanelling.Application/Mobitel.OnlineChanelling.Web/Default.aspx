<%@ Page Language="C#" AutoEventWireup="True" Inherits="Mobitel.OnlineChanelling.Web.Default" CodeBehind="Default.aspx.cs" %>

<%@ Register Src="Usercontrols/NavigationBar.ascx" TagName="NavigationBar" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7 no-js"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">

    <link href="css/metro-bootstrap.css" rel="stylesheet">
    <link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="css/iconFont.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet" />


    <!-- Load JavaScript Libraries -->
    <script src="js/jquery/jquery.min.js"></script>
    <script src="js/jquery/jquery.widget.min.js"></script>
    <script src="js/jquery/jquery.mousewheel.js"></script>
    <link href="js/prettify/prettify.css" rel="stylesheet">

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="js/load-metro.js"></script>

    <!-- Local JavaScript -->
    <script src="js/github.info.js"></script>
    <script src="js/docs.js"></script>

    <title>Mobitel Online Channelling</title>

    <style>
        .container {
            width: 1040px;
        }
    </style>
    <script type="text/javascript">
        function OnContactSelected(source, eventArgs) {

            var hdnValueID = "<%= hdnSelectedDoctor.ClientID %>";

            document.getElementById(hdnValueID).value = eventArgs.get_value();
            __doPostBack(hdnValueID, "");
        }
        function ClearHiddenField() {

            var hdnValueID = "hdnSelectedDoctor";

            document.getElementById(hdnValueID).value = "";
            __doPostBack(hdnValueID, "");
            document.getElementById('txtDoctorsSearch').value = "";
        }

    </script>
</head>
<body class="metro">
    <div class="container">
        <header class="margin20 nrm nlm">
            <uc1:NavigationBar ID="NavigationBar1" runat="server" />
        </header>

            <form id="form" runat="server">
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="main-content clearfix">
                <div class="tile-area no-padding clearfix">
                    <div class="tile-group no-margin no-padding clearfix" style="width: 100%">
                        <div class="tile double quadro-vertical bg-white ol-transparent no-right-margin" style="float: right;">
                            <fieldset>
                                <legend>Search For Your Doctor</legend>
                                <label class="font-color-black">Hospital</label>
                                <asp:DropDownList ID="ddlHospitals" runat="server" OnSelectedIndexChanged="ddlHospitals_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <label class="font-color-black">Specialty</label>
                                <asp:DropDownList ID="ddlSpeciality" runat="server" OnSelectedIndexChanged="ddlSpeciality_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <label class="font-color-black">Doctors Name</label>
                                <div class="input-control text" data-role="input-control">
                                    <input type="text" placeholder="Doctors Name">
                                    <button class="btn-clear" tabindex="-1"></button>
                                </div>
                                <div class="input-control text" data-role="input-control">
                                    <asp:hiddenfield id="hdnSelectedDoctor" OnValueChanged="hdnSelectedDoctor_ValueChanged" runat="server"/>
                                    <asp:TextBox ID="txtDoctorsSearch" runat="server"  ></asp:TextBox>
                                    <button class="btn-clear" tabindex="-1" onmouseup="ClearHiddenField()"></button>
                                </div>
                                <asp:AutoCompleteExtender ServiceMethod="SearchDoctores"
                                    MinimumPrefixLength="1" onclientitemselected="OnContactSelected"
                                    CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtDoctorsSearch"
                                    ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "true">
                                    
                                </asp:AutoCompleteExtender>
                                <label class="font-color-black">Date</label>
                                <div class="input-control text" data-role="datepicker" data-week-start="1">
                                    <input type="text">
                                    <button class="btn-date"></button>
                                </div>
                                <button class="button large primary">Search</button>
                                <button class="button success">Advance Search</button>
                            </fieldset>
                        </div>

                        <div class="tile quadro ol-transparent data-table">
                            <div class="tile-content font-color-black table-bordered">
                                <asp:GridView Width="100%" ID="DoctorSearchDataGrid" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="DoctorSearchDataGrid_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="table-alternative-row-style" />
                                    <HeaderStyle CssClass="text-left" />
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="tile triple double-vertical ol-transparent bg-white">
                            <div class="tile-content">
                                <div class="panel no-border">
                                    <div class="panel-header bg-blue fg-white">news</div>
                                    <div class="panel-content fg-dark nlp nrp">
                                        <img src="images/professionals.png" class="place-left margin10 nlm ntm size2">
                                        <strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry.
                                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                    Lorem Ipsum has been the industry's standard dummy text.
                               
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tile triple double-vertical ol-transparent bg-white">
                            <div class="tile-content">
                                <div class="panel no-border">
                                    <div class="panel-header bg-green fg-white">popular services</div>
                                    <div class="panel-content fg-dark nlp nrp">
                                        <img src="images/clouds.jpg" class="place-left margin10 nlm ntm size2">
                                        <strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry.
                                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                    Lorem Ipsum has been the industry's standard dummy text.
                               
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End first group -->
                </div>
            </div>
                    </ContentTemplate>
        </asp:UpdatePanel>
        </form>

        <footer>
            <div class="bottom-menu-wrapper">
                <ul class="horizontal-menu compact">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Views/ContactUs.aspx">Investor Relations</a></li>
                    <li><a href="Views/ContactUs.aspx">Channel History</a></li>
                    <li><a href="Views/ContactUs.aspx">Partners</a></li>
                    <li><a href="Views/ContactUs.aspx">Company</a></li>
                    <li><a href="Views/ContactUs.aspx">Careers</a></li>
                    <li><a href="Views/ContactUs.aspx">Member Home</a></li>
                    <li><a href="Views/ContactUs.aspx">Contact Us</a></li>
                </ul>
            </div>
        </footer>
    </div>
    <script src="js/hitua.js"></script>
</body>
</html>

