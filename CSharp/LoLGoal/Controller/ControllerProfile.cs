using LoLGoal.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoLGoal.Controller
{
    public class ControllerProfile
    {
        public object GetContext(SummonerDTO summoner)
        {
            var position = GetPosition(summoner);
            return null;
        }

        private object GetPosition(SummonerDTO summoner)
        {
            throw new NotImplementedException();
        }
    }
}
