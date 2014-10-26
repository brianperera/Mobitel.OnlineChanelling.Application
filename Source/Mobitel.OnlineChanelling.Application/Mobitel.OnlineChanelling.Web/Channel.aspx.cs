using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobitel.OnlineChanelling.Web
{
    public partial class Channel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ChannelSession> channelSessions = new List<ChannelSession>();
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(2), Status = "Available", Time = DateTime.Now.ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(2), Status = "Available", Time = DateTime.Now.AddHours(1).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(1), Status = "Available", Time = DateTime.Now.AddHours(2).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(3), Status = "Available", Time = DateTime.Now.AddHours(3).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(4), Status = "Available", Time = DateTime.Now.AddHours(4).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(5), Status = "Available", Time = DateTime.Now.AddHours(5).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(6), Status = "Available", Time = DateTime.Now.AddHours(6).ToShortTimeString(), Select = false });
            channelSessions.Add(new ChannelSession { AppointmentDate = DateTime.Now.AddDays(7), Status = "Available", Time = DateTime.Now.AddHours(7).ToShortTimeString(), Select = false });

            ChannelSessionDataGrid.DataSource = channelSessions;
            ChannelSessionDataGrid.DataBind();
        }
    }

    //TODO: temp
    public class ChannelSession
    {
        public bool Select { get; set; }
        public DateTime AppointmentDate { get; set; }
        public string Status { get; set; }
        public string Time { get; set; }
    }
}