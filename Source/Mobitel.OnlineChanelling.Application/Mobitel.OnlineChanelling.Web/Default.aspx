<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mobitel.OnlineChanelling.Web.Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnContactSelected(source, eventArgs) {

            var hdnValueID = "<%= hdnSelectedDoctor.ClientID %>";

            document.getElementById(hdnValueID).value = eventArgs.get_value();
            __doPostBack(hdnValueID, "");
        }
        function ClearHiddenField() {

            var hdnValueID = "<%= hdnSelectedDoctor.ClientID %>";

            document.getElementById(hdnValueID).value = "";
            __doPostBack(hdnValueID, "");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript" language="javascript">

                function jScript() {
                    
                    $('#ctl00_ContentPlaceHolder1_DoctorSearchDataGrid').click(function () {
                        var url = "/Channel.aspx";
                        $(location).attr('href', url);
                    });

                }
                Sys.Application.add_load(jScript);
            </script>            
            <div class="main-content clearfix">
                <div class="tile-area no-padding clearfix">
                    <div class="tile-group no-margin no-padding clearfix" style="width: 100%">
                        <div class="tile double quadro-vertical bg-white ol-transparent no-right-margin" style="float: right;">
                            <fieldset>
                                <legend>Search For Your Doctor</legend>
                                <label class="font-color-black">Doctors Name</label>
                                <div class="input-control text" data-role="input-control">
                                    <asp:HiddenField ID="hdnSelectedDoctor" OnValueChanged="hdnSelectedDoctor_ValueChanged" runat="server" />
                                    <asp:TextBox ID="txtDoctorsSearch" runat="server" placeholder="Doctors Name"></asp:TextBox>
                                    <button class="btn-clear" tabindex="-1" onmouseup="ClearHiddenField()"></button>
                                </div>
                                <asp:AutoCompleteExtender ServiceMethod="SearchDoctores"
                                    MinimumPrefixLength="1" onclientitemselected="OnContactSelected"
                                    CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                    TargetControlID="txtDoctorsSearch"
                                    ID="AutoCompleteExtender1" runat="server" FirstRowSelected="true">
                                </asp:AutoCompleteExtender>
                                <label class="font-color-black">Hospital</label>
                                <div class="input-control select" data-role="input-control">
                                    <asp:DropDownList ID="ddlHospitals" runat="server" OnSelectedIndexChanged="ddlHospitals_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <label class="font-color-black">Specialty</label>
                                <div class="input-control select" data-role="input-control">
                                    <asp:DropDownList ID="ddlSpeciality" runat="server" OnSelectedIndexChanged="ddlSpeciality_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                                <label class="font-color-black">Date</label>
                                <div class="input-control text" data-role="datepicker" data-week-start="1">
                                    <input type="text">
                                    <button class="btn-date"></button>
                                </div>
                                <div>
                                    <div class="accordion" data-role="accordion">
                                        <div class="accordion-frame">
                                            <a href="#" class="heading bg-lightBlue">Advanced Search</a>
                                            <div class="content">
                                                <div class="input-control radio margin10" data-role="input-control">
                                                    <label  class="font-color-black">
                                                        <input type="radio" name="r3"/>
                                                        <span class="check"></span>Male
                                                    </label>                                                     
                                                </div>
                                                <div class="input-control radio margin10" data-role="input-control">
                                                    <label  class="font-color-black">
                                                        <input type="radio" name="r3"/>
                                                        <span class="check"></span>Female
                                                    </label>                                                       
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <div class="tile quadro ol-transparent data-table">
                            <div class="doctor-search-grid tile-content font-color-black table-bordered">
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
</asp:Content>
