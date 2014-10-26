<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Channel.aspx.cs" Inherits="Mobitel.OnlineChanelling.Web.Channel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        <a href="/Default.aspx"><i class="icon-arrow-left-3 fg-darker smaller"></i></a>
        Channel<small class="on-right">your doctor</small>
    </h1>

    <div class="wizard-wrapper">
        <div class="wizard" id="wizard">
            <div class="steps">
                <div class="step">
                    <fieldset>
                        <legend>Channel Profile</legend>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><strong>Doctor Name</strong></td>
                                    <td>Dr Padmalal Pathiragae</td>
                                </tr>
                                <tr>
                                    <td><strong>Hospital</strong></td>
                                    <td>Asiri Surgical Hospital
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Specialization</strong></td>
                                    <td>Sports Medicine</td>
                                </tr>
                                <tr>
                                    <td><strong>Day</strong></td>
                                    <td>Any</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="tile quadro wide ol-transparent data-table">
                            <div class="doctor-search-grid tile-content font-color-black table-bordered">
                                <asp:GridView Width="100%" AutoGenerateColumns="false" ID="ChannelSessionDataGrid" runat="server" AllowPaging="True" PageSize="7">
                                    <Columns>
                                        <asp:CheckBoxField ControlStyle-CssClass="check" DataField="Select" HeaderText="Select" />
                                        <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:BoundField DataField="Time" HeaderText="Time" />
                                    </Columns>

                                    <AlternatingRowStyle CssClass="table-alternative-row-style" />
                                    <HeaderStyle CssClass="text-left" />
                                </asp:GridView>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="step">
                    <fieldset>
                        <legend>Channel Profile</legend>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td><strong>Doctor Name</strong></td>
                                    <td>Dr Padmalal Pathiragae</td>
                                </tr>
                                <tr>
                                    <td><strong>Hospital</strong></td>
                                    <td>Asiri Surgical Hospital
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Specialization</strong></td>
                                    <td>Sports Medicine</td>
                                </tr>
                                <tr>
                                    <td><strong>Date</strong></td>
                                    <td>Tuesday, 28 Oct, 2014</td>
                                </tr>
                                <tr>
                                    <td><strong>Time</strong></td>
                                    <td>17:00(24 hrs)</td>
                                </tr>
                                <tr>
                                    <td><strong>Patient No</strong></td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td><strong>Hospital</strong></td>
                                    <td>Asiri Surgical Hospital</td>
                                </tr>
                                <tr>
                                    <td><strong>Member</strong></td>
                                    <td>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                Yes
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                No
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Doctor Notification</strong></td>
                                    <td>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                Yes
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                No
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>No-Show Refund</strong></td>
                                    <td>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                Yes
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                        <div class="input-control radio no-margin" data-role="input-control">
                                            <label>
                                                No
                                                <input type="radio" name="r1" checked="">
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>
                    <div class="panel">
                        <div class="panel-header">
                            Terms and Conditions
                        </div>
                        <div class="panel-content">
                            <p><strong>Claim requests are accepted on the following basis;</strong></p>
                            <p>If claim request is made 1 hour before the appointment, the refund will be made in 2 working days</p>
                            <p>If claim request is made within 24hours after the appointment, refund will be made in 5 working days</p>
                            <p>Claim requests will not be accepted after 24 hours after the scheduled appointment time and the company is not liable for any refund pertaining to your appointment after this time</p>
                            <p><strong>You can make your claim request online or by calling our Hotline XXXXXXXXXX</strong></p>
                            <p><strong>The refund will be limited to the followings;</strong></p>
                            <p>Doctor's fees</p>
                            <p>Hospital channeling fees</p>
                            <p>eChannelling appointment fees</p>
                            <p><strong>This service does not include any other refund other than what is specified in this disclaimer.</strong></p>
                            <p><strong>A charge of Rs.250/- net is applicable for this service.</strong></p>
                            <div class="input-control checkbox">
                                <label>
                                    <input type="checkbox" />
                                    <span class="check"></span>
                                    I accept 
                                </label>
                            </div>

                            <div class="input-control checkbox">
                                <label>
                                    <input type="checkbox" />
                                    <span class="check"></span>
                                    Don't accept
                                </label>
                            </div>
                        </div>
                    </div>
                    <fieldset>
                        <legend>Patient's Information</legend>
                        <label>Name</label>
                        <div class="input-control text" data-role="input-control">
                            <input type="text" placeholder="Name">
                            <button class="btn-clear" tabindex="-1"></button>
                        </div>
                        <label>Tel No</label>
                        <div class="input-control text" data-role="input-control">
                            <input type="text" placeholder="012 345 6789">
                            <button class="btn-clear" tabindex="-1"></button>
                        </div>
                        <label>Identification Number</label>
                        <div class="input-control text" data-role="input-control">
                            <input type="text" placeholder="National ID, Passport No">
                            <button class="btn-clear" tabindex="-1"></button>
                        </div>

                        <label>E-mail</label>
                        <div class="input-control text" data-role="input-control">
                            <input type="text" placeholder="E-mail">
                            <button class="btn-clear" tabindex="-1"></button>
                        </div>

                        <label>Area</label>
                        <div class="input-control text" data-role="input-control">
                            <input type="text" placeholder="Please enter your closest city">
                            <button class="btn-clear" tabindex="-1"></button>
                        </div>

                        <label>Nationality</label>
                        <div class="input-control radio default-style" data-role="input-control">
                            <label>
                                <input type="radio" name="r1" checked="">
                                <span class="check"></span>
                                Local
                            </label>
                        </div>
                        <div class="input-control radio default-style" data-role="input-control">
                            <label>
                                <input type="radio" name="r1" checked="">
                                <span class="check"></span>
                                Foreign
                            </label>
                        </div>

                    </fieldset>
                </div>
                <div class="step">
                    <h1>Summary</h1>
                </div>
            </div>
        </div>

        <script>
            $(function () {
                $('#wizard').wizard({
                    locale: 'en',
                    stepper: true,
                    onCancel: function () {
                        $.Dialog({
                            title: 'Wizard',
                            content: 'Cancel button clicked',
                            shadow: true,
                            padding: 10
                        });
                    },
                    onHelp: function () {
                        $.Dialog({
                            title: 'Wizard',
                            content: 'Help button clicked',
                            shadow: true,
                            padding: 10
                        });
                    },
                    onFinish: function () {
                        $.Dialog({
                            title: 'Wizard',
                            content: 'Finish button clicked',
                            shadow: true,
                            padding: 10
                        });
                    }
                });
            });
        </script>
    </div>
</asp:Content>
