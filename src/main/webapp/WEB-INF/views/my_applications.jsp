<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar bg-white border-bottom mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">JobFlow</a>
            <a href="/" class="btn btn-outline-secondary">Back to Jobs</a>
        </div>
    </nav>

    <div class="container">
        <h3 class="mb-4">My Applications</h3>

        <div class="card shadow-sm border-0">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Job Title</th>
                        <th>Company</th>
                        <th>Location</th>
                        <th>Applied Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${apps}">
                        <tr>
                            <td class="fw-bold">${app.job.title}</td>
                            <td class="text-muted">${app.job.companyName}</td>
                            <td>${app.job.location}</td>
                            <td>${app.appliedDate}</td>
                            <td><span class="badge bg-success">${app.status}</span></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty apps}">
                <div class="p-5 text-center">
                    <p class="text-muted">You haven't applied to any jobs yet.</p>
                    <a href="/" class="btn btn-primary">Browse Jobs</a>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>