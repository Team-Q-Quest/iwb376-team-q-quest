import { SideBar } from "../components";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { HomePage, Reports, ManageAccount, Profile } from "../pages";

const AdminPanel = () => {
  const { id: pharamacy_id } = useParams();
  const [activeMenuItem, setActiveMenuItem] = useState("Home");
  const [pharamcyData, setPharmacyData] = useState({});

  useEffect(() => {
    const fetchdata = async () => {
      const response = await fetch(
        `http://localhost:9090/userApp/getPharmacyData/${pharamacy_id}`
      );
      const data = await response.json();
      setPharmacyData(data);
    };
    fetchdata();
  }, []);

  return (
    <div className="flex h-screen">
      {" "}
      {/* Use h-screen to make the parent full height */}
      {/* Sidebar */}
      <div className="w-32">
        {" "}
        {/* Set a fixed width for the sidebar */}
        <SideBar
          activeMenuItem={activeMenuItem}
          setActiveMenuItem={setActiveMenuItem}
          adminName={pharamcyData.name}
        />
      </div>
      {/* Main Content Area */}
      <div className="flex-grow flex items-center justify-center bg-white">
        {" "}
        {/* Ensure it takes the full remaining space */}
        {activeMenuItem === "Home" && (
          <div className=" h-full flex items-center justify-center">
            {" "}
            {/* Make child div fill full area */}
            <HomePage pharmacy_data={pharamcyData} />
          </div>
        )}
        {activeMenuItem === "Inventory" && (
          <div className="w-full h-full flex items-center justify-center">
            {" "}
            {/* Make child div fill full area */}
            <Profile />
          </div>
        )}
        {activeMenuItem === "Generate Reports" && (
          <div className="w-full h-full flex items-center justify-center">
            {" "}
            {/* Make child div fill full area */}
            <Reports />
          </div>
        )}
        {activeMenuItem === "Manage Account" && (
          <div className="w-full h-full flex items-center justify-center">
            {" "}
            {/* Make child div fill full area */}
            <ManageAccount />
          </div>
        )}
      </div>
    </div>
  );
};

export default AdminPanel;
