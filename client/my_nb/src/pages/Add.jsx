import React from 'react'

const Add = () => {
  return (
    <div className="add">
      <div className="content">
        <input type="text" placeholder="Title" />
      </div>
      <div className="menu">
        <div className="item">
          <div>i1</div>
          <div>i2</div>
          <input type="file" name="" id="file" />
          <label className="file" htmlFor="file">
            Upload Image
          </label>
          <div className="buttons">
            <button>Save as a draft</button>
            <button>Update</button>
          </div>
          <div className="item">
            <h1>Category</h1>
            <div className="cat">
              <input type="radio" name="cat" value="player" id="player" />
              <label htmlFor="player">Player</label>
            </div>
            <div className="cat">
              <input type="radio" name="cat" value="team" id="team" />
              <label htmlFor="team">Team</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Add