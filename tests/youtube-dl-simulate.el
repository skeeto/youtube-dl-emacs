(require 'youtube-dl)

(defvar youtube-dl-tests-root
  (file-name-directory (or load-file-name buffer-file-name)))

(defun youtube-dl-genid ()
  "Generate a random video ID."
  (let ((id (make-string 11 0))
        (s "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"))
    (dotimes (i (length id) id)
      (setf (aref id i)
            (aref s(cl-random (length s)))))))

(defun youtube-dl-add-random ()
  "Add a random video to the download queue."
  (interactive)
  (youtube-dl (youtube-dl-genid)))
(define-key youtube-dl-list-mode-map "A" #'youtube-dl-add-random)

;; Set up the simulate and fill the queue with random videos
(setf youtube-dl-program
      (expand-file-name "simulate.sh" youtube-dl-tests-root))
(dotimes (i 20)
  (youtube-dl-add-random))
(youtube-dl-list)
(delete-other-windows)
