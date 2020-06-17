using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.IO;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace ChattingProgram
{
    class Program
    {
        private static TcpListener server;
        private static List<TcpClient> clientList = new List<TcpClient>();

        static void Main(string[] args)
        {
            server = new TcpListener(IPAddress.Any, 12340);
            server.Start();

            Console.WriteLine("server started\n");
            Console.WriteLine("waiting for a client");

            while (true)
            {
                TcpClient client = server.AcceptTcpClient();
                clientList.Add(client);

                Thread t_handler = new Thread(new ParameterizedThreadStart(ClientListener));
                t_handler.Start(client);

                // 디버깅 용
                Debug.WriteLine("Thread count = {0}", Process.GetCurrentProcess().Threads.Count);
            }
        }

        static void ClientListener(object sender)
        {
            TcpClient client = null;
            StreamReader sr = null;

            try
            {
                client = sender as TcpClient;
                sr = new StreamReader(client.GetStream());

                Console.WriteLine("New Client connected\n");

                while (true)
                {
                    string message = sr.ReadLine();
                    if (!string.IsNullOrEmpty(message))
                    {
                        BroadCast(message, client);
                        Console.WriteLine("received data : {0}\n", message);
                    }
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
                Console.WriteLine("client disconnected\n");
                clientList.Remove(client);

                sr.Close();
                client.Close();

                Thread.CurrentThread.Abort();
            }
        }

        static void BroadCast(string message, TcpClient excludeClient)
        {
            foreach (TcpClient client in clientList)
            {
                if (client != excludeClient)
                {
                    StreamWriter sw = new StreamWriter(client.GetStream());
                    sw.WriteLine(message);
                    sw.Flush();
                }
            }
        }
    }

}
