import { Nav } from "../components";
import { useState } from "react";
import default_pharmacy_image from "../assets/images/ph.png"

const PharmacyCard = ({ pharmacy_data }) => (
  <div className="max-w-2xl mx-auto bg-white shadow-lg rounded-lg overflow-hidden">
    <img 
      src={pharmacy_data.image_url ? pharmacy_data.image_url:default_pharmacy_image} 
      alt={`${pharmacy_data.name} Pharmacy`} 
      className="w-full h-64 object-cover"
    />
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-4">{pharmacy_data.name} Pharmacy</h2>
      <div className="space-y-3">
        <p className="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2 text-blue-500" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
          </svg>
          {pharmacy_data.address}
        </p>
        <p className="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2 text-green-500" viewBox="0 0 20 20" fill="currentColor">
            <path d="M2 3a1 1 0 011-1h2.153a1 1 0 01.986.836l.74 4.435a1 1 0 01-.54 1.06l-1.548.773a11.037 11.037 0 006.105 6.105l.774-1.548a1 1 0 011.059-.54l4.435.74a1 1 0 01.836.986V17a1 1 0 01-1 1h-2C7.82 18 2 12.18 2 5V3z" />
          </svg>
          {pharmacy_data.phone_number}
        </p>
        <p className="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2 text-red-500" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clipRule="evenodd" />
          </svg>
          {pharmacy_data.open_hour} - {pharmacy_data.close_hour}
        </p>
        {/* <p className="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2 text-purple-500" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clipRule="evenodd" />
          </svg>
          Lat: {pharmacy_data.latitude}, Long: {pharmacy_data.longitude}
        </p> */}
      </div>
    </div>
  </div>
);

const HomePage = ({pharmacy_data}) => {
  // const [user, setUser] = useState({ name: "", email: "" });
  return (
    <div className="w-full min-h-screen bg-gray-100">
      <Nav />
      <div className="container mx-auto py-8">
        <h1 className="text-4xl font-bold text-center mb-8">
          Welcome, {pharmacy_data.name} Pharmacy
        </h1>
        <PharmacyCard pharmacy_data={pharmacy_data} />
      </div>
    </div>
  );
};

export default HomePage;