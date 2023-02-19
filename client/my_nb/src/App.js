import {
  createBrowserRouter,
  RouterProvider,
  Route,
  Outlet,
} from "react-router-dom";
import Register from "./pages/Register";
import Login from "./pages/Login";
import Home from "./pages/Home";
import Players from "./pages/Players";
import Player from "./pages/Player";
import Team from "./pages/Team";
import AddTeam from "./pages/addPages/AddTeam";
import GMs from "./pages/GMs";
import GM from "./pages/GM";
import Coaches from "./pages/Coaches";
import Coach from "./pages/Coach";
import Add from "./pages/Add";
import Teams from "./pages/Teams";
import Stats from "./pages/Stats";
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
        path: "/team/:id",
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
        path: "/gm/:id",
        element: <GM />,
      },
      {
        path: "/coaches",
        element: <Coaches />,
      },
      {
        path: "/coach/:id",
        element: <Coach />,
      },
      {
        path: "/addteam",
        element: <AddTeam />,
      },
      {
        path: "/add",
        element: <Add />,
      },
    ],
  },
  {
    path: "/register",
    element: <Register />,
  },
  {
    path: "/login",
    element: <Login />,
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
