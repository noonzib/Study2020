﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoLGoal.Model
{
    public class SummonerDTO
    {
        public int ProfileIconId { get; set; } // 여기 문법
        public string Name { get; set;}
        public long SummonerLevel { get; set; }
        public string Id { get; set; }
    }
}