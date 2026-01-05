<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${job.title} | Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <nav class="navbar bg-white border-bottom mb-4 shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">JobFlow</a>
            <a href="/" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Back to Jobs</a>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
                    <div class="card-header bg-primary text-white p-4">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h2 class="fw-bold mb-1">${job.title}</h2>
                                <h5 class="opacity-75"><i class="bi bi-building"></i> ${job.companyName}</h5>
                            </div>
                            <span class="badge bg-light text-primary fs-6 px-3 py-2 rounded-pill">${job.jobType}</span>
                        </div>
                    </div>

                    <div class="card-body p-4">
                        <div class="row mb-4 g-3">
                            <div class="col-md-6">
                                <div class="p-3 bg-light rounded-3">
                                    <small class="text-muted d-block mb-1">Location</small>
                                    <strong class="text-dark"><i class="bi bi-geo-alt-fill text-danger"></i> ${job.location}</strong>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 bg-light rounded-3">
                                    <small class="text-muted d-block mb-1">Salary Range</small>
                                    <strong class="text-dark"><i class="bi bi-currency-dollar text-success"></i> ${job.salaryRange}</strong>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-bold text-dark border-bottom pb-2 mb-3">Job Description</h5>
                        <p class="text-secondary" style="line-height: 1.7; white-space: pre-line;">
                            ${job.description}
                        </p>
                    </div>

                    <div class="card-footer bg-white p-4 border-top">
                        <div class="d-grid gap-2">
                            <c:choose>
                                <c:when test="${hasApplied}">
                                    <button class="btn btn-success btn-lg disabled" type="button" aria-disabled="true">
                                        <i class="bi bi-check-circle-fill"></i> Application Sent
                                    </button>
                                    <small class="text-center text-muted">You have already applied for this position.</small>
                                </c:when>
                                <c:otherwise>
                                    <form action="/apply/${job.id}" method="post">
                                        <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold shadow-sm">
                                            Apply Now <i class="bi bi-send-fill ms-2"></i>
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>