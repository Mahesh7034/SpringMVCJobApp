<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Portal | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        .job-card { transition: transform 0.2s; border: none; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .job-card:hover { transform: translateY(-5px); box-shadow: 0 8px 15px rgba(0,0,0,0.1); }
        .hero-section { background-color: #f8f9fa; padding: 3rem 0; margin-bottom: 2rem; }
        .avatar-circle { width: 35px; height: 35px; background-color: #6366f1; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; }
    </style>
</head>
<body class="bg-light">

   <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom sticky-top">
       <div class="container">
           <a class="navbar-brand" href="/">
               <div class="d-flex align-items-center gap-2">
                   <div style="background: linear-gradient(135deg, #6366f1, #a855f7); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                       <span style="color: white; font-weight: bold; font-size: 20px;">J</span>
                   </div>
                   <span style="font-family: 'Inter', sans-serif; font-weight: 700; font-size: 24px; color: #1e293b;">
                       Job<span style="color: #6366f1;">Flow</span>
                   </span>
               </div>
           </a>

           <div class="d-flex align-items-center gap-3">
               <a href="/create-job" class="btn btn-primary fw-bold px-3" style="background: #6366f1; border-radius: 10px; border:none;">
                   <i class="bi bi-plus-lg"></i> Post a Job
               </a>

               <div class="dropdown">
                   <button class="btn btn-light dropdown-toggle d-flex align-items-center gap-2 border" type="button" data-bs-toggle="dropdown" aria-expanded="false">

                       <div class="avatar-circle">
                           ${username.substring(0, 1).toUpperCase()}
                       </div>

                       <span class="fw-semibold d-none d-sm-inline">${username}</span>
                   </button>
                   <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                       <li><a class="dropdown-item" href="/profile"><i class="bi bi-person me-2"></i>My Details</a></li>
                       <li><a class="dropdown-item" href="/my-applications"><i class="bi bi-briefcase me-2"></i>My Applications</a></li>
                       <li><hr class="dropdown-divider"></li>
                       <li>
                           <form action="/logout" method="post" style="margin: 0;">
                               <button type="submit" class="dropdown-item text-danger"><i class="bi bi-box-arrow-right me-2"></i>Logout</button>
                           </form>
                       </li>
                   </ul>
               </div>
           </div>
       </div>
   </nav>
   <div class="hero-section text-center">
        <h1 class="display-5 fw-bold text-dark">Find Your Dream Job</h1>
        <p class="text-muted">Browse the latest opportunities below</p>
    </div>

    <div class="container pb-5">
        <div class="row">
            <c:forEach var="job" items="${jobs}">
                <div class="col-md-4 mb-4">
                    <div class="card job-card h-100 p-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h5 class="card-title fw-bold mb-0 text-truncate" style="max-width: 70%;">${job.title}</h5>
                                <span class="badge bg-info text-dark">${job.jobType}</span>
                            </div>
                            <h6 class="card-subtitle mb-3 text-primary">${job.companyName}</h6>

                            <p class="card-text text-muted small">
                                <i class="bi bi-geo-alt-fill text-secondary"></i> ${job.location} |
                                <i class="bi bi-cash-stack text-success"></i> ${job.salaryRange}
                            </p>

                            <p class="card-text">
                                <c:choose>
                                    <c:when test="${job.description.length() > 80}">
                                        ${job.description.substring(0, 80)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${job.description}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="card-footer bg-white border-0 pt-0">
                            <a href="/job/${job.id}" class="btn btn-outline-primary w-100 fw-semibold">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty jobs}">
                <div class="col-12 text-center mt-5">
                    <div class="p-5 bg-white rounded shadow-sm">
                        <h4 class="text-muted">No jobs posted yet.</h4>
                        <p>Be the first to add an opportunity!</p>
                        <a href="/create-job" class="btn btn-primary mt-2">Post a Job</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>