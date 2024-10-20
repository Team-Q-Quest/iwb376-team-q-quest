import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";
import "./index.css";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { GoogleOAuthProvider } from "@react-oauth/google";
import { AdminPanel, PharmacyRegistration, HomePage, SignIn,SystemAdmin } from "./pages";

createRoot(document.getElementById("root")).render(
  <GoogleOAuthProvider clientId="1077835799042-psl58fo1g9rl0otjudkoivbhnu8l95mq.apps.googleusercontent.com">
    <StrictMode>
      <Router>
        <Routes>
          <Route path="/" element={<App />} />
          <Route path="/sign-in" element={<SignIn />} />
          <Route path="/sign-up" element={<PharmacyRegistration />} />
          <Route path="/pharmacy-admin/:id" element={<AdminPanel />} />
          <Route path="/system-admin/:admin_id" element={<SystemAdmin/>}/>
          <Route path="*" element={<Navigate to="/sign-in" />} />
        </Routes>
      </Router>
    </StrictMode>
  </GoogleOAuthProvider>
);
