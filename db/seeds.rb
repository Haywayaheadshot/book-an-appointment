# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Doctor.create(name: "Doctor Kelvin Ben", photo:"images/doctor-kelvin.jpg", specialty:"Heart Surgeon", age: 42, location_of_work: "Kenya",
years_of_experience: 12, qualifications: "MBBS, MS (General Surgery), MCh (Cardiothoracic Vascular Surgery)",
bio: "Dr. Kelvin Ben earned his MBBS in 2000, his MS in General Surgery in 2002, and completed his MCh in Cardiovascular and Thoracic Surgery in 2005 from Kenya University.
He has done over 2,000 cardiac operations. This includes 500 minimally invasive surgeries, 400 total arterial coronary bypass surgeries, and 200 complex paediatric cardiac surgeries.
He is widely acknowledged for his expertise in total arterial coronary bypass surgery, paediatric cardiac surgery, valve repairs, structural heart disease, and surgery for cardiac failure.
He is trained for heart transplants, ventricular assist devices and has vast experience of performing hybrid cardiac surgeries.
Dr. Kelvin Ben has been awarded various fellowships in different disciplines such as pediatric cardiac surgery, cardiac transplant, minimally invasive surgery, and adult cardiac surgery.
Dr. Ben is listed amongst the top cardiac surgeons in Kenya.")

Doctor.create(name: "Doctor Abdullah Nganje", photo:"images/doctor-abdul.jpg", specialty:"Dermatology", age: 45, location_of_work: "Kenya",
years_of_experience: 13, qualifications: "MD, DNB (Dermatology, Venereology and Leprology), MNAMS, Fellowship in Lasers and Aesthetics (under IADVL)",
bio: "Dr. Abdullah Nganje Arora obtained his MBBS in 2010 from the Government Medical College, Kenya, and went on to gain his MD in Dermatology from Dayanand Medical
College and Hospital, Johannesburg, South Africa in 2015. He has extensive experience with botox, fillers, vitiligo surgery, lasers for scars, tattoos, vitiligo and hair removal, etc and
dermatosurgical procedures for various skin and hair issues. Dr. Nganje is an empathetic physician and always endeavours to provide the best solutions for his patients’ skin
woes and aspirations. Prior to joining Book A Doc Hospital, Dr. Nganje has worked with Postgraduate Institute of Medical Education and Research, Kenya.")

Doctor.create(name: "Doctor Mohammed El-Deeb", photo:"images/doctor-mo.jpg", specialty:"Pediatrics", age: 42, location_of_work: "Egypt",
years_of_experience: 14, qualifications: "MBBCh, MS (Pediatrics) Ain Shams University (Egypt) , MRCP (Pediatrics) UK",
bio: "Dr. Mohammed El-Deeb did Master’s degree in pediatrics from Egypt then he got MRCP(Paed) and MRCPCH from UK .He worked in children’s hospital ,Taif,KSA,.He then moved to UAE where he worked
as consultant and head of department of paediatrics in Al Noor Hospital,Abu Dhabai ,then he worked as consultant “A” paediatrics and neonatology,ministry of health and prevention,UAE.
He is adjunct assistant clinical professor of paediatrics in gulf medical university,UAE. Dr Ahmed has wealthy experience in paediatrics,neonatal intensive care unit and paediatric intensive
care unit and he efficiently manages all pediatric and neonatal emergencies.")

Doctor.create(name: "Doctor Abubakar Ummar", photo:"images/doctor-abu.jpg", specialty:"Radiology and Imaging", age: 40, location_of_work: "Ghana",
years_of_experience: 18, qualifications: " MBBS, MD (Radio-Diagnosis)",
bio: "Dr. Abubakar Ummar earned his MBBS in 2000 from V.S.S. Medical College, Accra, Ghana and his M.D. in Radio-Diagnosis in 2013 from S.C.B. Medical College, Cuttack, Accra, Ghana.
He has worked in various hospitals in Ghana as a Consultant Radiologist and has past experience in the U.A.E and moreover in RAK Hospital as a Specialist Radiologist.
He efficiently manages the diagnosis of human body using digital X-ray, Mammography, Ultrasound, Doppler, CT Scan, PET CT and MRI studies.")
