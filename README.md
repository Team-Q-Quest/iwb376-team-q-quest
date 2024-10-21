# iwb376-team-q-quest
Submission for innovate with Ballerina

# MedTrack: Pharmacy Locator and Inventory Management System

![MedTrack Landing Page](https://drive.google.com/uc?id=1jV6CFUOcT-RB5EcJ0wJzqx-U6BeLqQKf)


MedTrack is a comprehensive pharmacy management platform designed to streamline pharmacy operations and provide a seamless experience for customers. With MedTrack, pharmacies can efficiently manage their inventory, track stock levels, and ensure that medicines are readily available for customers.

For users, the platform offers an intuitive interface where they can easily search for medications and locate nearby pharmacies without the hassle of signing in or creating an account. MedTrack simplifies the pharmacy experience while maintaining accuracy and availability, empowering both pharmacies and their customers.

### Frontend Technologies:
- **React.js** for building a dynamic, responsive user interface
- **Tailwind CSS** for modern, utility-first styling
- Progressive Web App capabilities for enhanced user experience

### Backend Technologies:
- **Ballerina** as our primary backend framework
- **MySQL** for reliable data persistence
- RESTful APIs for seamless communication

### Authentication & Security:
- **Google OAuth** for streamlined authentication
- **JWT tokens** for secure session management
- **Role-Based Access Control (RBAC)** for pharmacy management

## Key Features & Technical Implementation

1. **Location-Based Pharmacy Finding**
   - Utilizes browser's geolocation API
   - Implements custom algorithms for distance calculation and sorting
   - Real-time pharmacy filtering based on medicine availability

2. **Frictionless User Experience**
   - No sign-up required for basic medicine search
   - Intuitive interface for quick medicine lookup
   - Responsive design for both mobile and desktop users

3. **Pharmacy Management Portal**
   - Secure authentication for pharmacy owners
   - Real-time inventory management capabilities
   - CRUD operations for medicine database

4. **Ballerina Backend Excellence**
   - Efficient handling of concurrent requests during peak usage
   - Built-in email notification system for pharmacy registration
   - Robust RBAC implementation using JWT verification
   - Native support for RESTful services

5. **Performance & Scalability**
   - Optimized database queries for quick response times
   - Efficient caching mechanisms
   - Load balanced architecture for handling multiple requests

![MedTrack pharmacy Dashboard](https://drive.google.com/uc?id=15MfpUAZw0PT-oIu5VITcxMi5eSDN_cbn)


## Technical Challenges & Solutions

1. **Authentication Complexity**
   - Implemented hybrid authentication system
   - Separate flows for users and pharmacy owners
   - Secure token management

2. **Location Accuracy**
   - Enhanced geolocation precision
   - Optimized distance calculation algorithms
   - Fail-safe mechanisms for location services

3. **Real-time Updates**
   - Implemented efficient polling mechanisms
   - Optimized database queries
   - Minimal latency in inventory updates
