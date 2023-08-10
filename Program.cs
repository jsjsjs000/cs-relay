using InteligentnyDomRelay.SmartHomeLibrary;
using Microsoft.EntityFrameworkCore;
using SmartHomeTool.SmartHomeLibrary;
using static SmartHomeTool.SmartHomeLibrary.Commands;

namespace InteligentnyDomRelay
{
	internal class Program
	{
		static CommunicationService com = null;

		public static List<Devices> devicesItems = new();

		static void Main(string[] _)
		{
			Common.SetDateFormat();
			Console.WriteLine("Program started.");

			DatabaseContext databaseContext = new();
			databaseContext.Database.EnsureCreated();
			DbSet<Devices> devices = databaseContext.Devices;
			//foreach (Devices devices1 in devices)
			//	Console.WriteLine($"{devices1.HardwareType1} {devices1.HardwareType2} {devices1.LineNumber}");

			Devices cu = databaseContext.Devices
					.Where(n => n.Active &&
											(n.HardwareType2 == DeviceVersion.HardwareType2Enum.CU ||
											 n.HardwareType2 == DeviceVersion.HardwareType2Enum.CU_WR))
					.First();

			devicesItems = databaseContext.Devices.Where(n => n.Active).ToList();

			com = new CommunicationService(cu)
			{
				Ip = "10.1.4.41",
				Port = 28844,
				connectionType = Communication.ConnectionType.Tcp
			};

			if (Environment.OSVersion.Platform == PlatformID.Unix)
				com.Ip = "192.168.8.120";

			Console.CancelKeyPress += Console_CancelKeyPress;
			while (!com.ExitThread)
				Thread.Sleep(10);
			Console.WriteLine("Program closed.");
		}

		private static void Console_CancelKeyPress(object? sender, ConsoleCancelEventArgs e)
		{
			com.ExitThread = true;
			Console.WriteLine("Ctrl+C pressed.");
		}
	}
}

/*
	NuGet console:
	Install-Package System.Management
	Install-Package System.IO.Ports
	Install-Package SharpZipLib
	Install-Package MySql.EntityFrameworkCore
	# Install-Package MySqlConnector

	https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core-example.html

	MySQL:
	inteligentny_dom, inteligentny_dom, 3ABItuPEzani

	SELECT HEX(Address), LineNumber, HardwareType1, HardwareType2, HardwareSegmentsCount,
			HardwareVersion, HEX(ParentItem), `Active`
	FROM `devices`;
*/
