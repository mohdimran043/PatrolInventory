using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http;
using System.Web.Http;
using System.IO;
using Microsoft.AspNetCore.Http;
using System.Threading;
using System.Net.Http.Headers;
using Microsoft.Extensions.Configuration;
using System.Reflection;
using PatrolWebApp.Controllers;
using Npgsql;

namespace PatrolWebApp.Controllers
{
    [Route("api/[controller]")]
    public class MaintainenceController : Controller
    {
        
        public String constr2 = "Server=BCI666016PC57;Database=patrols;User Id =patrol;Password=patrol;";

        [HttpPost("deviceslist")]
        public DataTable PostDevicesList()
        {
           

            SqlConnection cont = new SqlConnection();
            cont.ConnectionString = constr2;
            cont.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select * from Devices ", cont);
            da.Fill(dt);
            cont.Close();
            cont.Dispose();
           

            return dt;
        }

        [HttpPost("deviceslist2")]
        public DataTable PostDevicesList2()
        {


            NpgsqlConnection cont = new NpgsqlConnection();
            cont.ConnectionString = "server=localhost;Port=5432;User Id=postgres;password=admin;Database=PatrolWebApp";
            cont.Open();
            DataTable dt = new DataTable();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select d.deviceid,d.DeviceNumber,d.Model,d.Type,d.Defective,d.Rental,d.BarCode,a.Name from Devices d INNER JOIN Ahwal a ON a.AhwalID = d.AhwalID ", cont);
            da.Fill(dt);
            cont.Close();
            cont.Dispose();


            return dt;
        }


        [HttpPost("devicesinventory")]
        public DataTable PostDevicesInventoryList()
        {


            NpgsqlConnection cont = new NpgsqlConnection();
            cont.ConnectionString = "server=localhost;Port=5432;User Id=postgres;password=admin;Database=PatrolWebApp";
            cont.Open();
            DataTable dt = new DataTable();
            string Qry = "SELECT        DeviceCheckInOutID, CheckInOutStates.Name AS StateName, Ahwal.AhwalID, Ahwal.Name AS AhwalName, Devices.deviceNumber, Devices.Model, Devices.Type, Persons.MilNumber, ";
            Qry = Qry + " Ranks.Name AS PersonRank, Persons.Name AS PersonName, DevicesCheckInOut.SavedTime, CheckInOutStates.CheckInOutStateID";

            Qry = Qry + "  FROM Ahwal INNER JOIN";

            Qry = Qry + " Devices  ON Ahwal.AhwalID = Devices.AhwalID INNER JOIN";

            Qry = Qry + " DevicesCheckInOut ON Devices.DeviceID = DevicesCheckInOut.DeviceID INNER JOIN";

            Qry = Qry + " CheckInOutStates ON DevicesCheckInOut.CheckInOutStateID = CheckInOutStates.CheckInOutStateID INNER JOIN";

            Qry = Qry + " Persons ON Ahwal.AhwalID = Persons.AhwalID AND DevicesCheckInOut.PersonID = Persons.PersonID INNER JOIN";

            Qry = Qry + " Ranks ON Persons.RankID = Ranks.RankID";
            Qry = Qry + "  ORDER BY DevicesCheckInOut.SavedTime";

         NpgsqlDataAdapter da = new NpgsqlDataAdapter(Qry, cont);
            dt.Columns.Add("devicecheckinoutid");
            dt.Columns.Add("statename");
            dt.Columns.Add("ahwalid");
            dt.Columns.Add("ahwalname");
            dt.Columns.Add("devicenumber");
            dt.Columns.Add("model");

            dt.Columns.Add("type");
            dt.Columns.Add("milnumber");
            dt.Columns.Add("personrank");
            dt.Columns.Add("personname");
            dt.Columns.Add("savedtime");
            dt.Columns.Add("checkinoutstateid");
            da.Fill(dt);
            cont.Close();
            cont.Dispose();


            return dt;
        }


        [HttpPost("dispatchlist")]
        public DataTable Postdispatchlist()
        {


            NpgsqlConnection cont = new NpgsqlConnection();
            cont.ConnectionString = "server=localhost;Port=5432;User Id=postgres;password=admin;Database=PatrolWebApp";
            cont.Open();
            DataTable dt = new DataTable();
            String Qry = "SELECT AhwalMappingID, AhwalID, ShiftID, SectorID, DeviceRoleID, CityGroupID,(Select MilNumber From Persons where PersonID = AhwalMapping.PersonID) as MilNumber,";
Qry = Qry + " (Select RankID From Persons where PersonID = AhwalMapping.PersonID) as RankID, (Select Name From Persons where PersonID = AhwalMapping.PersonID) as PersonName, CallerID,  ";
Qry = Qry + " HasDevices, '' as Serial,  (Select DeviceNumber From Devices where DeviceID = AhwalMapping.DeviceID) as DeviceNumber, ";
            Qry = Qry + " DevicePersonStateID, SunRiseTimeStamp, SunSetTimeStamp, SortingIndex,(Select Mobile From Persons where PersonID = AhwalMapping.PersonID) as PersonMobile,IncidentID,";
            Qry = Qry + " LastStateChangeTimeStamp,(Select ShortName From sectors where SectorID=AhwalMapping.SectorID) as SectorDesc , (Select (select Name from Ranks where rankid = persons.rankid) From Persons where PersonID=AhwalMapping.PersonID) as RankDesc FROM AhwalMapping ";

            NpgsqlDataAdapter da = new NpgsqlDataAdapter(Qry, cont);
            da.Fill(dt);
            cont.Close();
            cont.Dispose();


            return dt;
        }

    }
}