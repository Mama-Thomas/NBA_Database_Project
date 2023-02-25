import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Awards = () => {
  const [awards, setAwards] = useState({});

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("/backend/awards/");
        const data = await response.json();
        setAwards(
          data.reduce(
            (acc, award) => ({ ...acc, [award.award_type]: [award.playerName, award.pid] }),
            {}
          )
        );
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  console.log(awards)

  return (
    <div className="awards-page">
      <h1>Award Winners For 2021-2022</h1>
      <p>
        <span className="award-type"> Most Valuable Player:</span>{" "}
        <Link className="player-link" to={`/player/${awards["mvp"]?.[1]}`}>{awards["mvp"]?.[0]}</Link>
      </p>
      <p>
        <span className="award-type">Defensive Player of the Year:</span>{" "}
        <Link className="player-link" to={`/player/${awards["defensive"]?.[1]}`}>
          {awards["defensive"]?.[0]}
        </Link>
      </p>
      <p>
        <span className="award-type">Rookie of the Year:</span>{" "}
        <Link className="player-link" to={`/player/${awards["rookie"]?.[1]}`}>{awards["rookie"]?.[0]}</Link>
      </p>
      <p>
        <span className="award-type">Sixth Man of the Year:</span>{" "}
        <Link className="player-link" to={`/player/${awards["sixthMan"]?.[1]}`}>{awards["sixthMan"]?.[0]}</Link>
      </p>
      <p>
        <span className="award-type">Most Improved Player:</span>{" "}
        <Link className="player-link" to={`/player/${awards["mip"]?.[1]}`}>{awards["mip"]?.[0]}</Link>
      </p>
      <p>
        <span className="award-type">Sportsmanship Award:</span>
        <Link className="player-link" to={`/player/${awards["sms"]?.[1]}`}>{awards["sms"]?.[0]}</Link>
      </p>
    </div>
  );
};
export default Awards;
