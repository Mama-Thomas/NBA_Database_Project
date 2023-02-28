import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Home = () => {
  const [topscorerPlayer, setTopscorerPlayer] = useState([]);
  const [hOffrtTeams, setHOffrtTeams] = useState([]);
  const [hppgPlayer, setHppgPlayer] = useState([]);
  const [hiddenGemTopTeam, setHiddenGemTopTeam] = useState([]);
  

  //the topScorer player
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/players/topscorer")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setTopscorerPlayer(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  //the five teams with the highest offrtg
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/teams/h5offrt")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setHOffrtTeams(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  //returns the player with the highest ppg for the atlanta hawks.
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/teams/hppg")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setHppgPlayer(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  //returns Hidden gem of the top team
  useEffect(() => {
    const fetchData = async () => {
      try {
        fetch("/backend/teams/hgtt")
          .then((resp) => resp.json())
          .then((json) => {
            console.log(json);
            setHiddenGemTopTeam(json);
          });
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  console.log(topscorerPlayer);
  console.log(hOffrtTeams);
  console.log(hppgPlayer);
  console.log(hiddenGemTopTeam);

  return (
    <div className="home">
      <div className="section">
        <div className="section-heading">
          <h1>Most Efficient Top Scorer</h1>
        </div>
        {topscorerPlayer.map((player) => (
          <div className="section-item" key={player.id}>
            <div className="content">
              <Link className="link" to={`/player/${player.pid}`}>
                <img src={player.playerImg} alt="" />
                <h2>{player.playerName}</h2>
              </Link>
              <h3>PPG:{player.ppg}</h3>
              <h3>3P%:{player.tpp}</h3>
              <h3>FG%:{player.fgp}</h3>
              <h3>Total:{player.total}</h3>
            </div>
          </div>
        ))}
      </div>

      <div className="section">
        <div className="section-heading">
          <h1>Player With The Highest PPG in the Atlanta Hawks</h1>
        </div>
        {hppgPlayer.map((player) => (
          <div className="section-item" key={player.pid}>
            <div className="content">
              <Link className="link" to={`/player/${player.pid}`}>
                <img src={player.playerImg} alt="" />
                <h2>{player.playerName}</h2>
              </Link>
              <h3> PPG: {player.ppg}</h3>
            </div>
          </div>
        ))}
      </div>

      <div className="section">
        <div className="section-heading">
          <h1> Hidden Gem of The Top Team</h1>
        </div>
        {hiddenGemTopTeam.map((player) => (
          <div className="section-item" key={player.pid}>
            <div className="content">
              <Link className="link" to={`/player/${player.pid}`}>
                <img src={player.playerImg} alt="" />
                <h2>{player.playerName}</h2>
              </Link>
              <h3> 3P%: {player.tpp}</h3>
              <h3> FG%: {player.fgp}</h3>
            </div>
          </div>
        ))}
      </div>

      <div className="section fft">
        <div className="section-heading">
          <h1>Five Teams With The Highest Offensive Rating</h1>
        </div>
        {hOffrtTeams.map((team) => (
          <div className="section-item" key={team.id}>
            <div className="content">
              <Link className="link" to={`/team/${team.id}`}>
                <img src={team.img} alt="" />
                <h2>{team.teamName}</h2>
              </Link>
              <h3> Offensive Rating: {team.ofr}</h3>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Home;
