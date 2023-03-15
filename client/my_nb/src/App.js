import {
  createBrowserRouter,
  RouterProvider,
  Outlet,
} from "react-router-dom";

import Home from "./pages/Home";
import Players from "./pages/Players";
import Player from "./pages/Player";
import Awards from "./pages/Awards";
import Arenas from "./pages/Arenas";
import Team from "./pages/Team";
import GMs from "./pages/GMs";
import Coaches from "./pages/Coaches";
import Teams from "./pages/Teams";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import './style.scss';

const Layout = () => {
  return (
    <>
      <Navbar />
      <Outlet />
      <Footer />
    </>
  );
};

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/players",
        element: <Players />,
      },
      {
        path: "/player/:id",
        element: <Player />,
      },
      {
        path: "/team/:name",
        element: <Team />,
      },
      {
        path: "/teams",
        element: <Teams />,
      },
      {
        path: "/gms",
        element: <GMs />,
      },
      
      {
        path: "/coaches",
        element: <Coaches />,
      },
      
      
      {
        path: "/awards",
        element: <Awards />,
      },
      {
        path: "/arenas",
        element: <Arenas />,
      },
      
    ],
  },
  
]);

function App() {
  return (
    <div className="app">
      <div className="container">
        <RouterProvider router={router} />
      </div>
    </div>
  );
}

export default App;
