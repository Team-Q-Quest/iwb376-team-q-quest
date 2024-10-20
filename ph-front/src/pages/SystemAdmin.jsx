import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Nav } from "../components";

const SystemAdmin = () => {
  const [admin, setAdmin] = useState(null);
  const [pharmacies, setPharmacies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState("");
  const { admin_id } = useParams();

  const setApproval = async (pharmacy_id, approval) => {
    const response = await fetch(
      `http://localhost:9090/userApp/updateApproval/${pharmacy_id}`,
      {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ approval: approval }),
      }
    );

    if (response.ok) {
      const data = await response.json();
      console.log("Approval updated successfully", data);
    } else {
      console.error("Failed to update approval");
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const adminResponse = await fetch(
          `http://localhost:9090/userApp/getAdminData/${admin_id}`
        );
        const adminData = await adminResponse.json();
        setAdmin(adminData);

        const pharmaciesResponse = await fetch(
          "http://localhost:9090/userApp/getPharmacyList"
        );
        const pharmaciesData = await pharmaciesResponse.json();
        setPharmacies(pharmaciesData);
      } catch (error) {
        console.error("Error fetching data:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [admin_id]);

  const handleApprovalChange = async (pharmacy_id, newStatus) => {
    if (
      window.confirm(
        `Are you sure you want to ${
          newStatus ? "approve" : "disapprove"
        } this pharmacy?`
      )
    ) {
      try {
        await setApproval(pharmacy_id, newStatus);

        setPharmacies(
          pharmacies.map((pharmacy) =>
            pharmacy.pharmacy_id === pharmacy_id
              ? { ...pharmacy, approved: newStatus }
              : pharmacy
          )
        );
      } catch (error) {
        console.error("Error updating pharmacy status:", error);
      }
    }
  };

  const filteredPharmacies = pharmacies.filter(
    (pharmacy) =>
      pharmacy.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pharmacy.email.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pharmacy.phone_number.includes(searchTerm) ||
      pharmacy.address.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const PharmacyTable = ({ pharmacies, title }) => (
    <div className="mt-8 bg-white rounded-lg shadow-lg p-6">
      <h2 className="text-2xl font-bold mb-4 text-indigo-700">{title}</h2>
      <div className="overflow-x-auto">
        <table className="min-w-full">
          <thead className="bg-indigo-100 rounded-t-lg">
            <tr>
              <th className="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider rounded-tl-lg">
                Name
              </th>
              <th className="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                Email
              </th>
              <th className="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                Phone
              </th>
              <th className="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                Address
              </th>
              <th className="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider rounded-tr-lg">
                Status
              </th>
            </tr>
          </thead>
          <tbody className="bg-white divide-y divide-indigo-200">
            {pharmacies.map((pharmacy) => (
              <tr
                key={pharmacy.pharmacy_id}
                className="hover:bg-indigo-50 transition-colors duration-200"
              >
                <td className="px-6 py-4 whitespace-nowrap">{pharmacy.name}</td>
                <td className="px-6 py-4 whitespace-nowrap">
                  {pharmacy.email}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  {pharmacy.phone_number}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  {pharmacy.address}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <select
                    className="block w-full bg-white border border-indigo-300 rounded-md py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 transition-colors duration-200"
                    value={pharmacy.approved.toString()}
                    onChange={(e) =>
                      handleApprovalChange(
                        pharmacy.pharmacy_id,
                        e.target.value === "true"
                      )
                    }
                  >
                    <option value="true">Approved</option>
                    <option value="false">Not Approved</option>
                  </select>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );

  if (loading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <div className="animate-spin rounded-full h-32 w-32 border-t-2 border-b-2 border-indigo-500"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-100 to-purple-100  px-4 sm:px-6 lg:px-8">
      <Nav />
      <div className="min-h-screen bg-gradient-to-br from-indigo-100 to-purple-100 py-12 px-4 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <h1 className="text-4xl font-extrabold text-center text-indigo-800 mb-10">
            System Admin Dashboard
          </h1>
          {admin && (
            <div className="bg-white p-6 rounded-lg shadow-lg mb-8 backdrop-filter backdrop-blur-lg bg-opacity-80">
              <h2 className="text-2xl font-semibold mb-4 text-indigo-700">
                Admin Info
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <p className="text-gray-700">
                  <span className="font-medium">Name:</span> {admin.admin_name}
                </p>
                <p className="text-gray-700">
                  <span className="font-medium">Email:</span>{" "}
                  {admin.admin_email}
                </p>
              </div>
            </div>
          )}
          <div className="mb-8">
            <input
              type="text"
              placeholder="Search pharmacies..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full px-4 py-2 rounded-lg border border-indigo-300 focus:outline-none focus:ring-2 focus:ring-indigo-500 transition-colors duration-200"
            />
          </div>
          <PharmacyTable
            pharmacies={filteredPharmacies.filter((p) => p.approved)}
            title="Approved Pharmacies"
          />
          <PharmacyTable
            pharmacies={filteredPharmacies.filter((p) => !p.approved)}
            title="Not Approved Pharmacies"
          />
        </div>
      </div>
    </div>
  );
};

export default SystemAdmin;
