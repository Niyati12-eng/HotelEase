<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<style>
    body {
        background-color: #f8f9fa;
    }
    .dashboard-header {
        background: linear-gradient(to right, #4e54c8, #8f94fb);
        color: white;
        padding: 50px 0;
        text-align: center;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    }
    .dashboard-header h1 {
        font-size: 3rem;
    }
    .dashboard-content {
        padding: 30px 0;
    }
    .form-container {
        margin-top: 50px;
        background: white;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card:hover {
        transform: scale(1.05);
        transition: all 0.3s ease;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">HotelEase</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="ulogout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<!-- Dashboard Header -->
<div class="dashboard-header">
    <div class="container">
        <h1>Admin Dashboard</h1>
        <p>Manage the entire hotel system efficiently.</p>
    </div>
</div>

<!-- Dashboard Content -->
<div class="container dashboard-content">
    <div class="row">
        <!-- Manage Users -->
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Manage Users</h5>
                    <p class="card-text">View all registered users.</p>
                    <a href="userlist.jsp" class="btn btn-primary">Go to Users</a>
                </div>
            </div>
        </div>

        <!-- Manage Rooms -->
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Manage Rooms</h5>
                    <p class="card-text">Add, update, or delete room information.</p>
                    <a href="addroom.jsp" class="btn btn-success">Go to Rooms</a>
                </div>
            </div>
        </div>

        <!-- View Room List -->
        <div class="col-md-4">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Room List</h5>
                    <p class="card-text">View all available and booked rooms.</p>
                    <a href="roomlist.jsp" class="btn btn-warning">View Rooms</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics Section -->
    <div class="row mt-5">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Total Registered Users</h5>
                    <% 
                    try {
                        String query = "SELECT COUNT(*) AS total_users FROM users";
                        PreparedStatement ps = conn.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();
                        int totalUsers = 0;
                        if (rs.next()) {
                            totalUsers = rs.getInt("total_users");
                        }
                    %>
                    <p class="card-text" style="font-size: 2rem;"><%= totalUsers %></p>
                    <% } catch (Exception e) { %>
                    <p class="card-text text-danger">Error fetching data</p>
                    <% } %>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Total Rooms</h5>
                    <% 
                    try {
                        String query = "SELECT COUNT(*) AS total_rooms FROM rooms";
                        PreparedStatement ps = conn.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();
                        int totalRooms = 0;
                        if (rs.next()) {
                            totalRooms = rs.getInt("total_rooms");
                        }
                    %>
                    <p class="card-text" style="font-size: 2rem;"><%= totalRooms %></p>
                    <% } catch (Exception e) { %>
                    <p class="card-text text-danger">Error fetching data</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Users Section -->
    <div class="form-container">
        <h3 class="text-center">Add a New User</h3>
        <% 
        String message = "";
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            if (username != null && email != null && contact != null && password != null && role != null) {
                try {
                    String query = "INSERT INTO users (username, email, contact, password, role, status) VALUES (?, ?, ?, ?, ?, 'Active')";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, username);
                    ps.setString(2, email);
                    ps.setString(3, contact);
                    ps.setString(4, password);
                    ps.setString(5, role);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        message = "<div class='alert alert-success'>User added successfully!</div>";
                    } else {
                        message = "<div class='alert alert-danger'>Failed to add user. Please try again.</div>";
                    }
                } catch (Exception e) {
                    message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
                }
            } else {
                message = "<div class='alert alert-warning'>Please fill out all fields.</div>";
            }
        }
        %>
        <%= message %>
        <form method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label>Contact</label>
                <input type="text" name="contact" class="form-control" placeholder="Enter contact number" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role" class="form-control" required>
                    <option value="User">User</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add User</button>
        </form>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>


</body>
</html>