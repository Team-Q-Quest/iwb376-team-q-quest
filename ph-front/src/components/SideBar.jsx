import React from "react";
import {
  StatsIcon,
  AuthorizeIcon,
  ManageIcon,
  HomeIcon,
} from "../assets/icons/icon";

const SideBar = ({ activeMenuItem, setActiveMenuItem, adminName }) => {
  const menuItems = [
    { name: "Home", icon: <HomeIcon /> },
    { name: "Inventory", icon: <AuthorizeIcon /> },
    { name: "Generate Reports", icon: <StatsIcon /> },
    { name: "Manage Account", icon: <ManageIcon /> },
  ];

  return (
    <div className="bg-gradient-to-b from-slate-800 to-slate-700 fixed left-0 bottom-0 top-0 w-[300px] text-white shadow-lg">
      <div className="p-6">
        <h2 className="text-2xl font-bold mb-2">Welcome,</h2>
        <p className="text-xl text-gray-300 truncate">{adminName}</p>
      </div>
      <nav className="mt-8">
        <ul className="space-y-2">
          {menuItems.map((item, index) => (
            <li key={index}>
              <button
                className={`w-full flex items-center px-6 py-3 text-left transition-colors duration-200 ease-in-out
                  ${
                    activeMenuItem === item.name
                      ? "bg-slate-600 text-white"
                      : "text-gray-300 hover:bg-slate-600 hover:text-white"
                  }`}
                onClick={() => setActiveMenuItem(item.name)}
              >
                <span className="inline-block w-6 h-6 mr-4">{item.icon}</span>
                <span className="text-lg">{item.name}</span>
              </button>
            </li>
          ))}
        </ul>
      </nav>
    </div>
  );
};

export default SideBar;
