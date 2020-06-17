using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.IO;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace Client
{
    class Client
    {
        static void Main(string[] args)
        {
            TcpClient client = null;
            StreamWriter sw = null;

            try
            {
                client = new TcpClient("192.168.0.126", 12340);
                Console.WriteLine("Connected to server.\n");

                Thread c_thread = new Thread(new ParameterizedThreadStart(Client_Read));
                c_thread.Start(client);

                sw = new StreamWriter(client.GetStream());

                while (true)
                {
                    if (client.Connected)
                    {
                        Console.Write("send data : ");
                        string input = Console.ReadLine();
                        sw.WriteLine(input);
                        sw.Flush();
                    }
                    else
                        break;
                }
            }
            catch (SocketException se)
            {
                Console.WriteLine("SocketException : {0}", se.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception : {0}", ex.Message);
            }
            finally
            {
                sw.Close();
                client.Close();
            }

            Console.WriteLine("Press the ENTER key to continue...");
            Console.ReadLine();
        }

        static void Client_Read(object sender)
        {
            TcpClient client = sender as TcpClient;
            StreamReader sr = new StreamReader(client.GetStream());

            try
            {
                while (true)
                {
                    string message = sr.ReadLine();
                    if (!string.IsNullOrEmpty(message))
                        Console.WriteLine("\nreceived data : {0}\n", message);
                }
            }
            catch (SocketException se)
            {
                Console.WriteLine("SocketException : {0}\n", se.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception : {0}\n", ex.Message);
            }
            finally
            {
                sr.Close();
                client.Close();
            }
        }
    }
}
