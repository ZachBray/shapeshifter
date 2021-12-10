(lang dune 2.9)
(name shapeshifter)

(source (github ZachBray/shapeshifter))
(license Apache-2.0)
(authors "Zachary Bray")
(maintainers "zachbray+opam@gmail.com")

(generate_opam_files true)

(package
  (name shapeshifter)
  (synopsis "A low-level library for working with data in buffers")
  (depends 
    (ppx_jane :with-test)
    (core_bench :with-test)))

