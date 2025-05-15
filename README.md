


📸 PhotoGalleryApp

PhotoGalleryApp — это iOS-приложение на Swift, отображающее все фотографии и скриншоты из системной фотогалереи в виде квадратной сетки. Пользователь может открыть любое изображение и просматривать его в полноэкранном режиме с возможностью перелистывания свайпом влево/вправо.

🚀 Основной функционал:
	•	Запрос разрешения на доступ к фотобиблиотеке
	•	Отображение всех изображений (PHAsset) в UICollectionView
	•	Квадратная плиточная сетка, адаптивная по ширине экрана
	•	Полноэкранный просмотр выбранного фото с перелистыванием
	•	Обработка отказа в доступе через UIAlertController

🛠 Технологии:
	•	Swift + UIKit
	•	UICollectionView + UICollectionViewFlowLayout
	•	PHPhotoLibrary, PHAsset, PHImageManager
	•	Структурированный код с разделением ответственности (ViewController, PhotoPageViewController, PhotoLibraryManager)
	•	SwiftLint для соблюдения стиля

 Проект PhotoGalleryApp был создан с учебной и практической целью — для:

🎯 Цель 
	•	Изучения работы с PHPhotoLibrary и PHAsset — получения изображений из системной фотогалереи
	•	Практики использования UICollectionView для создания адаптивной сетки изображений
	•	Освоения принципов архитектуры UIKit-приложений: разделения логики, структурирования кода, работы с разрешениями
	•	Повышения уровня владения Swift и UIKit
	•	Подготовки к работе над реальными приложениями, которые требуют доступа к медиаконтенту

📌 Также проект соответствует типичному техническому заданию от ментора или на джуниор-позицию, проверяющему:
	•	умение работать с системными API (Photos)
	•	настраивать UI без Storyboard
	•	реализовывать навигацию, работу с правами доступа и отображение динамических данных



 📸 PhotoGalleryApp

PhotoGalleryApp is an iOS application built with Swift that displays all photos and screenshots from the device’s system photo library in a square-tile grid layout. Users can tap any image to view it fullscreen and swipe left or right to navigate through the gallery.

🚀 Main Features:
	•	Requests permission to access the photo library
	•	Displays all images (PHAsset) using UICollectionView
	•	Square grid layout that adapts to screen width
	•	Fullscreen photo viewer with swipe navigation
	•	Alerts the user if access is denied, with a link to Settings

🛠 Technologies Used:
	•	Swift + UIKit
	•	UICollectionView with UICollectionViewFlowLayout
	•	PHPhotoLibrary, PHAsset, PHImageManager
	•	Clean architecture with separation of concerns (ViewController, PhotoPageViewController, PhotoLibraryManager)
	•	SwiftLint for code style enforcement

 🎯 Purpose of the Project

PhotoGalleryApp was created as a learning and practice project, with the following goals:
	•	To learn how to work with PHPhotoLibrary and PHAsset to access images from the system photo library
	•	To practice using UICollectionView to build an adaptive photo grid layout
	•	To understand UIKit app architecture principles, including code separation, permission handling, and dynamic data rendering
	•	To improve skills in Swift and UIKit development
	•	To prepare for real-world app development where photo access and media display are required

📌 This project also simulates a typical junior-level task or mentor assignment, designed to evaluate:
	•	Proficiency with system APIs like Photos
	•	UI layout without Storyboards
	•	Navigation and permission flow
	•	Dynamic collection-based interfaces
