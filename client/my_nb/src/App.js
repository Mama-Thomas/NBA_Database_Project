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
import GMs from "./pages/GMs";
import Coaches from "./pages/Coaches";
import Add from "./pages/Add";
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
        path: "/teams",
        element: <Teams />,
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
