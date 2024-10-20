import React, { useState, useEffect } from 'react';
import './AboutUs.css'; // Import external CSS for animations

const AboutUs = () => {
  const [loading, setLoading] = useState(true);

  // Simulate loading time
  useEffect(() => {
    const timer = setTimeout(() => setLoading(false), 2000); // 2-second loading effect
    return () => clearTimeout(timer);
  }, []);

  return (
    <div className={`about-container ${loading ? 'loading' : 'loaded'}`}>
      {loading ? (
        <div className="loader">
          <div className="spinner"></div>
          <p>Loading...</p>
        </div>
      ) : (
        <>
          <h1 className="about-heading">About Us</h1>
          <p className="about-text">
            <strong>Welcome to Pharmacytracker,</strong>{' '}
            where we revolutionize how pharmacies operate, streamlining daily
            processes and enhancing patient care.
          </p>

          <h2 className="about-subheading">Our Vision</h2>
          <p className="about-text">
            To empower pharmacies with state-of-the-art technology, enabling
            them to focus more on patient care and less on administrative tasks.
          </p>

          <h2 className="about-subheading">Key Features:</h2>
          <ul className="about-list">
            <li>
              <strong>Efficient Prescription Handling:</strong> Automate and
              track prescriptions with ease, reducing errors and ensuring
              patients receive the correct medication on time.
            </li>
            <li>
              <strong>Real-Time Inventory Management:</strong> Keep track of
              stock levels, manage reorders, and prevent stockouts, ensuring
              your pharmacy is always equipped.
            </li>
            <li>
              <strong>Patient Records & History:</strong> Maintain a secure and
              organized database of patient information, prescriptions, and
              medication history.
            </li>
            <li>
              <strong>Sales and Billing Integration:</strong> Simplify your
              financial operations by seamlessly integrating sales and billing
              functions with real-time analytics and reporting.
            </li>
          </ul>

          <h2 className="about-subheading">Why Choose Us?</h2>
          <ul className="about-list">
            <li>
              <strong>User-Friendly Interface:</strong> Designed with simplicity
              in mind, our system is intuitive and easy to navigate.
            </li>
            <li>
              <strong>Data Security:</strong> We prioritize data protection,
              ensuring that all sensitive patient and pharmacy data is encrypted
              and stored securely.
            </li>
            <li>
              <strong>24/7 Support:</strong> Our dedicated support team is
              always ready to assist with any issues or questions, ensuring
              smooth operation of your pharmacy at all times.
            </li>
          </ul>

          <p className="about-text">
            Join us in transforming the pharmacy experience, delivering better
            service and care to your patients with Pharmacytracker.
          </p>
        </>
      )}
    </div>
  );
};

export default AboutUs;
