// Script: project-create-klausul-level.js
// Fungsionalitas:
// 1. Mengisi otomatis field auditor dengan nama user login
// 2. Mengambil level berdasarkan klausul yang dipilih dan mengirimkan ke backend

document.addEventListener('DOMContentLoaded', function() {
    // 1. Isi otomatis auditor jika ada input dengan id 'auditor' dan window.authUser
    if (window.authUser && document.getElementById('auditor')) {
        document.getElementById('auditor').value = window.authUser;
        document.getElementById('auditor').readOnly = true;
    }

    // 2. Handle klausul select change
    const klausulSelect = document.querySelector('select[name="klausul_id[]"]');
    if (klausulSelect) {
        klausulSelect.addEventListener('change', function() {
            // Tidak perlu menampilkan form level, karena level otomatis
            // Tapi bisa simpan id level ke hidden input
            const selectedKlausulIds = Array.from(klausulSelect.selectedOptions).map(opt => opt.value);
            fetch('/project/get-levels-by-klausul', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({ klausul_ids: selectedKlausulIds })
            })
            .then(res => res.json())
            .then(data => {
                // Hapus semua input hidden level_id[] lama
                document.querySelectorAll('input[name="level_id[]"]').forEach(e => e.remove());
                // Tambahkan input hidden level_id[] untuk setiap id
                data.level_ids.forEach(id => {
                    let hidden = document.createElement('input');
                    hidden.type = 'hidden';
                    hidden.name = 'level_id[]';
                    hidden.value = id;
                    klausulSelect.parentNode.appendChild(hidden);
                });
            });
        });
        // Trigger change on load (jika ada value default)
        klausulSelect.dispatchEvent(new Event('change'));
    }
});
