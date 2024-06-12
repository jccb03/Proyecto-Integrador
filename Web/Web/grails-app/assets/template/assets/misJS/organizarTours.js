document.addEventListener("DOMContentLoaded", function() {
            const itemsPerPage = 3;
            let currentPage = 1;

            const tours = document.querySelectorAll('.tour');
            const irAListaTours = document.getElementById("lista");
            function renderTours(page) {
                const start = (page - 1) * itemsPerPage;
                const end = start + itemsPerPage;

                tours.forEach((tour, index) => {
                    if (index >= start && index < end) {
                        tour.classList.add('visible');
                    } else {
                        tour.classList.remove('visible');
                    }
                });
            }

            function renderPagination() {
                const paginationContainer = document.getElementById("number-pages");
                paginationContainer.innerHTML = '';

                const totalPages = Math.ceil(tours.length / itemsPerPage);

                for (let i = 1; i <= totalPages; i++) {
                    const pageButton = document.createElement("li");
                    pageButton.innerHTML = `<a href="">${i}</a>`;
                    if (i === currentPage) {
                        pageButton.classList.add("active");
                    }
                    pageButton.querySelector('a').addEventListener("click", (event) => {
                        event.preventDefault();
                        currentPage = i;
                        renderTours(currentPage);
                        updatePagination();

                        irAListaTours.scrollIntoView({ behavior: 'smooth' });
                    });
                    paginationContainer.appendChild(pageButton);
                }
            }

            function updatePagination() {
                const pageButtons = document.querySelectorAll("#number-pages li");
                pageButtons.forEach(button => button.classList.remove("active"));
                if (pageButtons[currentPage - 1]) {
                    pageButtons[currentPage - 1].classList.add("active");
                }
            }

            document.getElementById("prevButton").addEventListener("click", (event) => {
                event.preventDefault();
                if (currentPage > 1) {
                    currentPage--;
                    renderTours(currentPage);
                    updatePagination();
                     irAListaTours.scrollIntoView({ behavior: 'smooth' });
                }
            });

            document.getElementById("nextButton").addEventListener("click", (event) => {
                event.preventDefault();
                const totalPages = Math.ceil(tours.length / itemsPerPage);
                if (currentPage < totalPages) {
                    currentPage++;
                    renderTours(currentPage);
                    updatePagination();
                    irAListaTours.scrollIntoView({ behavior: 'smooth' });
                }
            });

            renderTours(currentPage);
            renderPagination();
        });