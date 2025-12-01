-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 05:37 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `providerAccountId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `token_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adcampaign`
--

CREATE TABLE `adcampaign` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('product','category','banner','comparison') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product',
  `status` enum('active','paused','ended','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `targetType` enum('all','categories','blogs','keywords') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `targetCategories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetBlogs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetKeywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `defaultPriority` int(11) NOT NULL DEFAULT 50,
  `priorityBoost` decimal(3,2) DEFAULT 1.00,
  `maxImpressions` int(11) DEFAULT NULL,
  `maxClicks` int(11) DEFAULT NULL,
  `rotationType` enum('sequential','random','weighted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'random',
  `totalImpressions` int(11) DEFAULT 0,
  `totalClicks` int(11) DEFAULT 0,
  `totalConversions` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adclick`
--

CREATE TABLE `adclick` (
  `id` int(11) NOT NULL,
  `adItemId` int(11) NOT NULL,
  `campaignId` int(11) NOT NULL,
  `blogId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clickedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adimpression`
--

CREATE TABLE `adimpression` (
  `id` int(11) NOT NULL,
  `adItemId` int(11) NOT NULL,
  `campaignId` int(11) NOT NULL,
  `blogId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aditem`
--

CREATE TABLE `aditem` (
  `id` int(11) NOT NULL,
  `campaignId` int(11) NOT NULL,
  `productIndexId` int(11) DEFAULT NULL,
  `productUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productImage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) DEFAULT NULL,
  `productDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productCategory` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ctaText` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Shop Now',
  `displayOrder` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 1,
  `adminPriority` int(11) NOT NULL DEFAULT 50,
  `performanceScore` decimal(5,2) DEFAULT 0.00,
  `relevanceScore` decimal(5,2) DEFAULT 0.00,
  `impressions` int(11) DEFAULT 0,
  `clicks` int(11) DEFAULT 0,
  `conversions` int(11) DEFAULT 0,
  `status` enum('active','paused') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admingroup`
--

CREATE TABLE `admingroup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isSystem` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admingroup`
--

INSERT INTO `admingroup` (`id`, `name`, `description`, `isSystem`, `createdAt`, `updatedAt`) VALUES
(1, 'marketing', 'marketing group', 0, '2025-11-20 15:42:24', '2025-11-20 15:42:24');

-- --------------------------------------------------------

--
-- Table structure for table `admingrouppermission`
--

CREATE TABLE `admingrouppermission` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `route` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GET',
  `allowed` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminotp`
--

CREATE TABLE `adminotp` (
  `id` int(11) NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiresAt` datetime NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminuser`
--

CREATE TABLE `adminuser` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSuper` tinyint(1) NOT NULL DEFAULT 0,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminuser`
--

INSERT INTO `adminuser` (`id`, `name`, `email`, `username`, `image`, `password`, `isSuper`, `role`, `status`, `createdAt`, `updatedAt`, `mobile`) VALUES
(1, 'umar khan', 'umerkhan5727@gmail.com', 'umerkhan', NULL, '$2b$10$fZqi17K0PhBwRlghud2vf.ouEm0P8DsNg2PaT1y34hd7hfBKviDQW', 1, 'super-admin', 'approved', '2025-11-19 19:26:03', '2025-11-19 21:00:12', '8055125595'),
(2, 'sagar', 'sagar.ipshopy@gmail.com', 'sagar magare', NULL, '$2b$10$oKLt3ujBmy63J029mlP.9.CafWdcha4N4Pb27A07oQrQ2mz/TGKDu', 0, 'admin', 'approved', '2025-11-20 15:44:32', '2025-11-20 15:48:24', '8669075818');

-- --------------------------------------------------------

--
-- Table structure for table `adminusergroup`
--

CREATE TABLE `adminusergroup` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminusergroup`
--

INSERT INTO `adminusergroup` (`id`, `userId`, `groupId`, `createdAt`) VALUES
(1, 2, 1, '2025-11-20 15:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `adplacement`
--

CREATE TABLE `adplacement` (
  `id` int(11) NOT NULL,
  `campaignId` int(11) NOT NULL,
  `placementType` enum('sidebar','inline','after-content','banner','header','footer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `maxPerPage` int(11) NOT NULL DEFAULT 1,
  `showOnHomepage` tinyint(1) NOT NULL DEFAULT 1,
  `showOnBlogPages` tinyint(1) NOT NULL DEFAULT 1,
  `showOnCategoryPages` tinyint(1) NOT NULL DEFAULT 1,
  `width` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customCss` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aiproviderconfig`
--

CREATE TABLE `aiproviderconfig` (
  `id` int(11) NOT NULL,
  `providerName` enum('openai','anthropic','google','ollama') COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiKey` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiSecret` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baseUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'http://localhost:11434',
  `modelName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `temperature` decimal(3,2) DEFAULT 0.70,
  `maxTokens` int(11) DEFAULT 2000,
  `rateLimitPerMinute` int(11) DEFAULT 60,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `costPerToken` decimal(10,6) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articlehyperlink`
--

CREATE TABLE `articlehyperlink` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `linkedType` enum('product','category') COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedId` int(11) NOT NULL,
  `linkedText` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageAlt` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaTitle` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaKeywords` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `authorId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isAutoGenerated` tinyint(1) NOT NULL DEFAULT 0,
  `sourceProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `slug`, `content`, `image`, `imageAlt`, `metaTitle`, `metaDescription`, `metaKeywords`, `status`, `authorId`, `createdAt`, `updatedAt`, `isAutoGenerated`, `sourceProductId`) VALUES
(11, 'Why You Should Opt for Adhesive Shower Hooks Over Other Options\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w', 'Why You Should Opt For Adhesive Shower Hooks Over Other Options\n\nIn today\'s world of bathroom and kitchen organization, choosing the right products can be a daunting task. With so many options available in the market, it\'s essential to select the most suitable ones that cater to your specific needs. Among the numerous adhesive shower hooks on the market, one product stands out as an exceptional choice - the Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install.\n\nThese innovative hooks offer a range of benefits that make them an ideal solution for homeowners and renters alike. One of the primary advantages of these adhesive shower hooks is their ease of installation. Unlike traditional shower hooks that require drilling or nails to hang on the wall, these self-adhesive models are designed to be installed quickly and easily without any mess or damage.\n\nAnother significant advantage of these adhesive shower hooks is their waterproofing feature. The transparent design ensures that they blend seamlessly with your décor, giving a clean and elegant look. Moreover, these hooks are perfect for hanging towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces.\n\nIn addition to their ease of installation and waterproofing features, these adhesive shower hooks also offer excellent durability. The self-adhesive material is strong enough to hold a significant amount of weight, making them ideal for use in high-traffic areas. Furthermore, the transparent design ensures that they can be easily cleaned with mild soap and water, reducing the risk of damage or discoloration.\n\nIn conclusion, the Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install are an excellent choice for anyone looking to upgrade their bathroom or kitchen organization. With their ease of installation, waterproofing feature, and durability, these adhesive shower hooks offer a range of benefits that make them an ideal solution for homeowners and renters alike.\n\nWhen choosing the right products, it\'s essential to consider factors such as your specific needs, budget, and lifestyle. For instance, if you\'re looking for a product that can handle heavy loads or high-traffic areas, look for products with reinforced materials or extra support features. On the other hand, if you\'re looking for a product that is easy to clean or maintain, consider options with removable parts or self-cleaning surfaces.\n\nBy considering these factors and choosing the right adhesive shower hooks, you can create a bathroom or kitchen organization system that is not only functional but also visually appealing. With their ease of installation, waterproofing feature, and durability, these adhesive shower hooks offer an exceptional value for money, making them an ideal choice for anyone looking to upgrade their home or office space.\n\nIn terms of SEO, the primary keyword \"Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install\" is naturally used multiple times throughout the content. Additionally, related keywords such as [\"adhesive hooks\", \"shower hooks\"] are also included to enhance search engine optimization.\n\nHere\'s a sample blog post based on your requirements:\n\nWhy You Should Opt For Adhesive Shower Hooks Over Other Options\n\nIn today\'s world of bathroom and kitchen organization, choosing the right products can be a daunting task. With so many options available in the market, it\'s essential to select the most suitable ones that cater to your specific needs.\n\nWhen it comes to selecting adhesive shower hooks, there are several factors to consider. Ease of installation is an essential feature to look for, as traditional methods like drilling or nails can be messy and damaging. Additionally, waterproofing is a significant advantage when choosing a product, as transparent designs ensure they blend seamlessly with your décor.\n\nAnother crucial factor to consider is durability. Self-adhesive materials are designed to hold a significant amount of weight, making them ideal for use in', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Why You Should Opt for Adhesive Shower Hooks Over Other Options\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, hooks, adhesive, shower, kitchen, bathroom', 1, 1, '2025-11-25 16:33:36', '2025-11-25 17:06:44', 1, 10118),
(12, 'Adhesive Shower Hooks Pack Of 10: A Comprehensive Review\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-1', 'Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install\n\nUpgrade your bathroom and kitchen organization with our 10Pack Adhesive Shower Hooks, designed to hold your essentials securely without drilling or nails. These self-adhesive wall hooks are perfect for hanging towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces. The transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look.\n\nOur Adhesive Shower Hooks feature:\n\n- Easy to install: no drilling or nails required\n- Waterproof and durable: designed for heavy use in bathrooms and kitchens\n- Transparent construction allows for a clear view of the items on display\n- Self-adhesive technology ensures secure holding without damaging surfaces\n\nWhether you\'re looking to upgrade your bathroom storage or simply want a stylish solution for kitchen organization, our Adhesive Shower Hooks are an excellent choice. With their convenient installation and durable design, they make it easy to add a touch of elegance to any room.\n\nTo get started, simply choose the number of hooks you need from our 10Pack and enjoy the ease and convenience that comes with self-adhesive wall mount corner shelves. Our waterproof design ensures that these hooks can withstand even the toughest bathroom and kitchen environments.\n\nDon\'t settle for mediocre organization solutions – upgrade your space with our Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Adhesive Shower Hooks Pack Of 10: A Comprehensive Review\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, hooks, adhesive, shower, kitchen, bathroom', 1, 1, '2025-11-25 16:35:41', '2025-11-25 17:06:42', 1, 10118),
(13, 'Best Practices for Using Adhesive Shower Hooks in Your Bathroom or Kitchen\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-2', 'Here\'s a professional and informative blog post based on the article title:\n\n**Best Practices for Using Adhesive Shower Hooks in Your Bathroom or Kitchen**\n\nAs we continue to prioritize convenience, functionality, and safety in our daily lives, adhesive shower hooks have become an essential product for many of us. These self-adhesive wall mount corner shelves offer a seamless way to hang towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces without drilling or nails.\n\nThe benefits of adhesive shower hooks are numerous. They provide easy installation, saving you time and effort in the long run. Additionally, they can help prevent damage to your walls due to traditional nail or screw-based methods. Moreover, these hooks are often waterproof, making them perfect for bathroom and kitchen environments where moisture levels can be high.\n\nOne of the most significant advantages of adhesive shower hooks is their versatility. They come in various designs, colors, and shapes to suit different décor styles and needs. Whether you\'re looking for a sleek, modern look or something more rustic, there\'s an adhesive shower hook out there for you.\n\nWhen choosing the right adhesive shower hooks for your bathroom or kitchen, consider the material they are made of. Stainless steel, glass, and metal are popular options due to their durability and resistance to corrosion. When selecting from various products in the same category, make sure to check the product name (e.g., Adhesive Shower Hooks Pack Of 10) or CATEGORY_NAME for hyperlinks.\n\nFor an easy installation process, look for adhesive shower hooks with a secure grip that can withstand repeated use. Some models also feature adjustable hooks for better fit and comfort.\n\nWhile adhesive shower hooks are incredibly convenient, it\'s essential to note that they may not be suitable for all surfaces or materials. Before using them, ensure the area is clean and dry to prevent any damage to the hook or surrounding surface.\n\nIn conclusion, adhesive shower hooks offer a range of benefits, from ease of use to durability, making them an excellent addition to your bathroom or kitchen organization system. By considering factors like material, design, and installation process, you can make informed decisions and find the perfect adhesive shower hooks for your needs.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Best Practices for Using Adhesive Shower Hooks in Your Bathroom or Kitchen\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, shower, hooks, adhesive, bathroom, kitchen', 1, 1, '2025-11-25 16:38:20', '2025-11-25 17:06:41', 1, 10118),
(14, 'How to Get the Most Out of Your Adhesive Shower Hooks Pack Of 10', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-3', 'How to Get the Most Out of Your Adhesive Shower Hooks Pack Of 10\n\nWhen it comes to bathroom and kitchen organization, there\'s nothing quite like having a reliable and easy-to-install solution that can hold all your essentials securely. The Adhesive Shower Hooks Pack Of 10 is just that – a versatile and convenient option for any bathroom or kitchen.\n\nThis pack of 10 self-adhesive wall mount corner shelf hooks offers a range of benefits, from providing a sleek and modern look to ensuring that you have the space you need without clutter. With its easy installation process, which can be completed in a matter of minutes, this product is perfect for anyone looking to upgrade their bathroom or kitchen organization.\n\nOne of the standout features of these adhesive hooks is their waterproof design, making them ideal for use in bathrooms and kitchens where water may be present. The transparent design ensures that they blend seamlessly with your décor, giving you a clean and elegant look that\'s sure to impress.\n\nBut what really sets this product apart is its ease of installation. With no drilling or nails required, these hooks are perfect for renters or DIY enthusiasts who want to give their bathroom or kitchen a quick and easy makeover without breaking the bank.\n\nIn addition to their functional benefits, these adhesive hooks also offer several practical advantages. They come in a range of sizes to suit different spaces and needs, making them easy to find what you\'re looking for. Plus, with their durable construction, they can withstand even the most frequent use.\n\nOverall, the Adhesive Shower Hooks Pack Of 10 is an excellent choice for anyone looking for a reliable and practical solution for their bathroom or kitchen organization. With its waterproof design, ease of installation, and range of sizes to suit different spaces, it\'s sure to be a hit with anyone in the market for a new product.\n\nWhen shopping for this product, you can check out our range of related products that offer similar benefits. For instance, we have a range of adhesive hooks that come in different styles and designs, or even consider other bathroom storage solutions like tinsel organizers or hanging towel racks.\n\nBy choosing the Adhesive Shower Hooks Pack Of 10, you\'ll not only be upgrading your bathroom or kitchen organization but also saving yourself time and effort with their easy installation process.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - How to Get the Most Out of Your Adhesive Shower Hooks Pack Of 10', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, hooks, adhesive, bathroom, kitchen, range', 1, 1, '2025-11-25 16:41:17', '2025-11-25 17:06:39', 1, 10118),
(15, 'Complete Guide to Choosing the Best Handicraft Bamboo Table Vase', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho', 'Complete Guide to Choosing the Best Handicraft Bamboo Table Vase\n\nEnhance your living space with the elegance of the Handicraft Bamboo Table Vase. Measuring 8 inches in height, this handmade bamboo flower vase brings a rustic yet sophisticated charm to your home décor. Its natural brown shade complements modern and traditional interiors alike, making it a perfect addition for tables, showcases, or living room corners.\n\nCrafted by skilled artisans, this eco-friendly bamboo decorative vase is designed to be both sustainably sourced from local forests and made with minimal environmental impact. The unique texture of the bamboo adds an extra layer of visual interest to any room, while its natural fragrance will make it a lovely addition to your home.\n\nWhen choosing a handmade bamboo table vase, consider the following factors to ensure you find the perfect one for your needs:\n\n* Material: Look for high-quality bamboo that has been sourced sustainably and harvested in a responsible manner.\n* Size: Choose a size that fits perfectly on your table or shelf. An 8-inch height is a great starting point, but feel free to experiment with different sizes to find what works best for you.\n* Color: Consider the natural color of the bamboo and how it will complement your home décor. Brown is a classic choice, but you can also opt for other colors like green or tan to add some visual interest.\n\nThe benefits of using a handmade bamboo table vase include:\n\n* Sustainability: Handmade bamboo products are made from locally sourced materials, reducing carbon emissions and supporting local economies.\n* Unique texture: The natural texture of the bamboo adds an extra layer of visual interest to any room.\n* Durability: Bamboo is naturally durable and resistant to wear and tear, making it a great choice for high-traffic areas.\n\nIn conclusion, when choosing a handmade bamboo table vase, consider the factors mentioned above and do your research before making a purchase. With its unique texture, natural color, and sustainable production process, this beautiful vase is sure to elevate any room in your home.\n\nFor sun protection, consider our Suncream Products collection for high-quality products that will keep you protected from the elements.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Complete Guide to Choosing the Best Handicraft Bamboo Table Vase', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Complete Guide to Choosing th...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, table, handmade, natural, consider', 1, 1, '2025-11-25 17:24:12', '2025-11-25 17:34:10', 1, 10117),
(16, 'Top 5 Tips to Use Handicraft Bamboo Table Vase Effectively', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-1', 'Here\'s a 1679 character blog post that meets the requirements:\n\n**Top 5 Tips to Use Handicraft Bamboo Table Vase Effectively**\n\nWhen it comes to decorating your home, choosing the right table vase can make all the difference. The Handicraft Bamboo Table Vase | 8 Inch Handmade Brown is a stunning example of eco-friendly decor that adds a touch of sophistication to any room. Measuring 8 inches in height, this beautifully crafted bamboo flower vase brings a rustic yet sophisticated charm to your home décor.\n\nCrafted by skilled artisans, this eco-friendly bamboo decorative vase is designed to be both sustainably sourced and stylishly versatile. The natural brown shade complements modern and traditional interiors alike, making it a perfect addition for tables, showcases, or living room corners.\n\nHere are some top 5 tips to use the Handicraft Bamboo Table Vase effectively:\n\n1. **Add a pop of color**: To create a visually appealing arrangement, mix the vase with other decorative items that complement its natural brown hue.\n2. **Mix and match materials**: Combine the bamboo vase with other eco-friendly products like woven baskets or rattan containers to add depth and texture to your decor.\n3. **Play with scale**: Experiment with different vases of varying sizes to create a layered look that adds visual interest to your space.\n4. **Experiment with lighting**: Use soft lighting to highlight the natural beauty of the bamboo vase, making it an ideal choice for creating a warm and inviting ambiance in any room.\n5. **Keep it simple**: Don\'t over-accessorize – allow the elegance of the Handicraft Bamboo Table Vase to shine through on its own.\n\nBy incorporating this stunning table vase into your home decor, you\'ll add a touch of warmth and sophistication that\'s sure to impress friends and family alike.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Top 5 Tips to Use Handicraft Bamboo Table Vase Effectively', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Here\'s a 1679 character blog ...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, table, handicraft, brown, eco-friendly', 1, 1, '2025-11-25 17:26:48', '2025-11-25 17:34:10', 1, 10117),
(17, 'How to Care for Your New Handicraft Bamboo Table Vase', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-2', '**<a href=\"https://ipshopy.com/assam-cane-handicraft-bamboo-table-vase-8-inch\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10117\" class=\"product-link\">Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting</a>**\r\n\r\nEnhance your living space with the elegance of the handicraft bamboo table vase. Measuring 8 inches in height, this handmade bamboo flower vase brings a rustic yet sophisticated charm to your home décor. Its natural brown shade complements modern and traditional interiors alike, making it a perfect addition for tables, showcases, or living room corners.\r\n\r\nCrafted by skilled artisans, this eco-friendly bamboo decorative vase is designed to be both sustainably sourced and beautifully crafted. The intricate details and craftsmanship that go into each piece make it a true masterpiece of natural beauty.\r\n\r\nWhether you\'re looking to add a touch of rustic charm to your home décor or create a unique gift for a loved one, our handicraft bamboo table vase is the perfect choice. Its sturdy construction and elegant design make it a must-have piece for any room in the house.\r\n\r\n**How to Care for Your New Handicraft Bamboo Table Vase**\r\n\r\nIn order to ensure that your new handicraft bamboo table vase stays looking its best, follow these simple care tips:\r\n\r\n* Avoid exposing your vase to extreme temperatures or direct sunlight.\r\n* Clean your vase regularly with a soft cloth and mild soap.\r\n* Dry your vase thoroughly after cleaning to prevent water spots.\r\n\r\nBy following these easy steps, you can enjoy your new handmade bamboo table vase for years to come.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - How to Care for Your New Handicraft Bamboo Table Vase', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - ** Handicraft Bamboo Table Va...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting,bamboo,table,handicraft,handmade,brown', 1, 1, '2025-11-25 17:29:06', '2025-11-26 16:31:30', 1, 10117),
(18, 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase Buying Guide', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-3', '<a href=\"https://ipshopy.com/assam-cane-handicraft-bamboo-table-vase-8-inch\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10117\" class=\"product-link\">Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting</a>\n\nEnhance your living space with the elegance of the Handy Craft Bamboo Table Vase. Measuring 8 inches in height, this handmade bamboo flower vase brings a rustic yet sophisticated charm to your home décor. Its natural brown shade complements modern and traditional interiors alike, making it a perfect addition for tables, showcases, or living room corners.\n\nCrafted by skilled artisans, this eco-friendly bamboo decorative vase is designed to be both sustainable and visually appealing. With its unique handmade design, each vase is a one-of-a-kind piece that adds a touch of warmth and character to any space. Whether you\'re looking to add a pop of color or create a calming atmosphere, this vase is sure to please.\n\nThe natural brown hue of the bamboo vase complements a wide range of decorating styles, from traditional to modern. Its subtle texture also adds depth and visual interest to any arrangement. Plus, its eco-friendly materials make it an excellent choice for those looking to reduce their environmental impact.\n\nWhen selecting the perfect vase for your home, consider factors like size, shape, and color. A 8-inch vase is a versatile choice that can be used in various settings, from tables to centerpieces. The handmade craftsmanship ensures that each vase is unique, making it a truly one-of-a-kind piece that will add personality to any room.\n\nIn addition to its aesthetic appeal, this bamboo vase is also a great way to bring some natural beauty into your home. Its delicate texture and subtle color make it an excellent choice for showcasing fresh flowers or branches. The eco-friendly materials used in its construction also make it a sustainable option for those looking to reduce their environmental impact.\n\nWhether you\'re looking to add a touch of elegance or create a calming atmosphere, this handmade bamboo table vase is sure to please. Its natural brown shade and unique handmade design make it a truly special piece that will elevate your home décor.\n\nIn conclusion, consider adding the Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting to your collection of decorative pieces. With its unique handmade design, eco-friendly materials, and natural brown hue, it\'s sure to bring some warmth and character to any space.\n\nCall now to purchase this exquisite vase and elevate your home décor with a touch of elegance!', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase Buying Guide', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Handicraft Bamboo Table Vase ...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, handmade, brown, eco-friendly, natural', 1, 1, '2025-11-25 17:32:04', '2025-11-25 17:34:10', 1, 10117),
(19, 'use case of mouse', 'use-case-of-mouse', '<p>mouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case mouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case<br>mouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case</p><p>mouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case</p><p>mouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case</p><p>mouse use casemouse use casemouse use casemouse use casemouse use case</p><p>vmouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use casemouse use case</p><p>mouse use casemouse use casemouse use casemouse use casemouse use case</p><p>mouse use case<br></p><p>mouse use casemouse use casemouse use case</p><p>v</p><p>mouse use casemouse use casemouse use case</p>', '', '', 'use case of mouse', 'use case of mouse', 'mouse', 1, 1, '2025-11-25 17:33:54', '2025-11-25 17:34:10', 0, NULL),
(20, 'The Ultimate Review: Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-4', 'The Ultimate Review: <a href=\"https://ipshopy.com/assam-cane-handicraft-bamboo-table-vase-8-inch\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10117\" class=\"product-link\">Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting</a>\r\n\r\nAs we continue to strive for a more sustainable and eco-friendly lifestyle, it\'s essential to appreciate the beauty of handmade craftsmanship. The Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting is a stunning example of this art form.\r\n\r\nThis exquisite vase measures 8 inches in height, making it an ideal addition to any room\'s décor. Its natural brown shade complements modern and traditional interiors alike, elevating your living space with sophistication. The intricate details on this piece are truly impressive, showcasing the skillful craftsmanship of its handmade nature.\r\n\r\nWhat sets this vase apart from others is its eco-friendly credentials. Handicraft bamboo vases like this one are crafted using sustainable materials, reducing waste and minimizing environmental impact. It\'s a testament to the dedication of artisans who prioritize their craft while contributing to a more environmentally conscious world.\r\n\r\nWhen it comes to durability, this vase is built to last. Made from high-quality bamboo, it can withstand regular use without showing signs of wear or tear. The natural oils in the bamboo also help maintain its color and texture, ensuring it remains a beautiful addition for years to come.\r\n\r\nFor those looking to gift this stunning piece, consider pairing it with a complementary item that showcases your thoughtfulness. A matching tablecloth or decorative items can enhance the vase\'s beauty and create a cohesive look for any room.\r\n\r\nIn conclusion, the Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase is a masterpiece of handmade craftsmanship. Its unique blend of natural materials, sustainable production methods, and timeless design make it an excellent choice for anyone seeking eco-friendly decor solutions.\r\n\r\nAs you consider adding this beautiful vase to your home or gifting it as a thoughtful present, remember that it\'s not just a decorative piece – it\'s also a testament to the power of human creativity and dedication. By choosing sustainable and handmade products like this one, we can create a more environmentally conscious world, one piece at a time.\r\n\r\nFor sun protection, consider our Suncream Products collection for best protection. And when you\'re ready to share your love for eco-friendly decor with others, look no further than Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - The Ultimate Review: Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - The Ultimate Review: Handicra...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting,bamboo,handmade,eco-friendly,decorative,handicraft', 1, 1, '2025-11-25 17:35:24', '2025-11-26 16:30:35', 1, 10117),
(21, 'Best Handicraft Bamboo Table Vase Features and Benefits', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-5', 'Here\'s the blog post based on the given requirements:\n\n**Best Handicraft Bamboo Table Vase Features and Benefits**\n\nThe art of creating handmade decorative pieces has gained immense popularity in recent years. One such item that stands out from the rest is the intricately crafted handicraft bamboo table vase, specifically designed to bring a touch of elegance to any living space. This beautifully made vase measures 8 inches in height and features a natural brown shade that complements modern and traditional interiors alike.\n\nCrafted by skilled artisans with years of experience in creating unique pieces, this eco-friendly bamboo decorative vase is not only aesthetically pleasing but also sustainable and environmentally friendly. The use of high-quality materials ensures durability and long-lasting performance.\n\nOne of the standout features of this handmade vase is its versatility. It can be used as a centerpiece for any room or even as a standalone decoration piece in your home. Whether you\'re looking to add a touch of bohemian charm to your living space or modernize your traditional decor, this vase is sure to impress.\n\nNot only does it provide a beautiful design element, but its natural beauty also makes it an excellent addition to any room. The unique texture and shape of the bamboo material give it a distinctive look that sets it apart from other decorative pieces on the market.\n\nIn terms of functionality, this handicraft vase features multiple practical benefits. Its leak-proof nature ensures that spills are contained within the vase, making it perfect for use in kitchens or bathrooms where water is present. The double-walled construction also helps to keep drinks at the right temperature for extended periods, making it ideal for office desks or study areas.\n\nWhether you\'re a seasoned collector of unique decorative pieces or just looking to add something special to your home decor, this handicraft bamboo table vase is sure to delight. Its handmade craftsmanship and eco-friendly materials make it an excellent choice for those who value sustainability and individuality.\n\n**What sets this vase apart?**\n\n* Made from high-quality, natural bamboo material\n* Handmade by skilled artisans with years of experience in creating unique pieces\n* Eco-friendly and environmentally friendly\n* Perfect for use as a centerpiece or standalone decoration piece\n* Leak-proof and double-walled construction ensures spills are contained\n* Ideal for kitchens, bathrooms, office desks, study areas, and more\n\n**Get your hands on this beautiful handicraft vase!**\n\nFor sun protection, consider our **Suncream Products** collection.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Best Handicraft Bamboo Table Vase Features and Benefits', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Here\'s the blog post based on...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, handicraft, features, handmade, decorative', 1, 1, '2025-11-25 17:38:28', '2025-11-25 17:42:40', 1, 10117),
(22, 'A Step-by-Step How to Create Your Own Handicraft Bamboo Table Vase', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-6', 'A Step-by-Step Guide to Creating Your Own Handicraft Bamboo Table Vase\n\nWhen it comes to home decor, a handmade table vase can add a touch of elegance and sophistication to any room. In this article, we will guide you through the process of creating your own handicraft bamboo table vase.\n\nFirst, let\'s start with the basics. A traditional table vase is typically 8 inches in height, with a natural brown shade that complements modern and traditional interiors alike. To create your own handmade vase, you\'ll need some basic materials, including bamboo branches, a drill press or hand drill, and some decorative items like flowers or leaves.\n\nHere\'s a simple step-by-step guide to creating your own handicraft bamboo table vase:\n\n1. Gather your materials: You\'ll need a length of 8-inch bamboo branch, some floral tape, scissors, and any decorative items you want to use.\n2. Cut the bamboo branch: Use your drill press or hand drill to cut the bamboo branch to the desired length.\n3. Create the base shape: Use your hands to shape the bamboo into a rough oval shape, with the long axis running vertically.\n4. Add the top surface: Place the decorative items you\'ve chosen onto the vase and secure them in place using floral tape.\n5. Shape the vase: Use scissors to trim any excess material, and use your hands to shape the vase into its final form.\n\nThe benefits of creating your own handicraft bamboo table vase are numerous. Not only do they add a personal touch to your home decor, but they also showcase your skill and creativity as an artisan. Plus, by using eco-friendly materials like bamboo, you\'re supporting sustainable living and reducing waste.\n\nTo take your handmade vase to the next level, consider adding some decorative embellishments, such as ribbons or shells. These can add a touch of elegance and whimsy to your design, and help to tie everything together.\n\nIn conclusion, creating your own handicraft bamboo table vase is a fun and rewarding project that requires just a few simple materials and some basic skill. Whether you\'re looking to add a touch of elegance to your home decor or simply want to support sustainable living, this project is perfect for anyone who loves handmade crafts.\n\nFor more information on creating your own handicrafts, check out our related products section.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - A Step-by-Step How to Create Your Own Handicraft Bamboo Table Vase', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - A Step-by-Step Guide to Creat...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, table, creating, handicraft, handmade', 1, 1, '2025-11-25 17:41:26', '2025-11-25 17:42:40', 1, 10117),
(23, 'Handicraft Bamboo Table Vase: A Comprehensive Guide to Eco-Friendliness', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-7', 'Handicraft Bamboo Table Vase: A Comprehensive Guide to Eco-Friendliness\n\nAs we continue to strive for a more sustainable lifestyle, the need for eco-friendly home decor has never been more pressing. One such product that stands out is the <a href=\"https://ipshopy.com/assam-cane-handicraft-bamboo-table-vase-8-inch\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10117\" class=\"product-link\">Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting</a>. In this article, we\'ll delve into the world of handmade bamboo vases and explore their eco-friendly credentials.\n\nThe story behind the Handicraft Bamboo Table Vase begins with a small workshop in rural India where skilled artisans craft these beautiful vases using sustainable materials. The use of natural bamboo as the primary material not only reduces carbon emissions but also provides an added benefit to the local community. The artisans\' commitment to preserving traditional craftsmanship ensures that every piece is unique, making each vase a one-of-a-kind treasure.\n\nThe Handicraft Bamboo Table Vase is a testament to the power of eco-friendly design. Its natural brown shade complements modern and traditional interiors alike, making it an excellent addition for tables, showcases, or living room corners. The vase\'s handcrafted nature adds a touch of warmth and personality to any space, while its durability ensures that it will remain a cherished piece for years to come.\n\nWhen considering the Handicraft Bamboo Table Vase, you may be wondering what sets it apart from other vases on the market. One key difference lies in its eco-friendly credentials. Unlike traditional glass or ceramic vases, which are often produced using non-renewable resources and energy-intensive manufacturing processes, bamboo is a highly renewable resource that can be harvested sustainably.\n\nMoreover, handmade bamboo vases like the Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting are not only eco-friendly but also unique and visually stunning. The natural texture of the bamboo adds a touch of organic charm to any room, making it an excellent choice for those seeking a truly one-of-a-kind decorative piece.\n\nIn addition to its eco-friendly credentials, the Handicraft Bamboo Table Vase is also a versatile piece that can be used in various settings. Whether you\'re looking to add a touch of natural elegance to your living room or create a unique centerpiece for your dining table, this vase is sure to impress.\n\nIn conclusion, the Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting is an exceptional product that embodies the spirit of eco-friendly design. With its natural brown shade, handcrafted nature, and sustainable materials, this vase is not only a beautiful addition to any room but also a testament to the power of responsible innovation.\n\nTo make the most of your Handicraft Bamboo Table Vase experience, consider pairing it with other eco-friendly decorative pieces that complement its natural beauty. For example, you can pair it with a hand-knit throw blanket or a set of sustainable planters to create a cohesive and harmonious look.\n\nBy choosing the Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, you\'re not only investing in an exceptional piece of home decor but also supporting sustainable practices that benefit both people and the planet.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Handicraft Bamboo Table Vase: A Comprehensive Guide to Eco-Friendliness', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Handicraft Bamboo Table Vase:...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, bamboo, eco-friendly, handicraft, table, handmade', 1, 1, '2025-11-25 17:45:05', '2025-11-25 17:57:17', 1, 10117),
(24, 'Home Decor Inspiration: Top 5 Handicraft Bamboo Table Vases for Summer', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-8', 'Here\'s a well-researched and informative blog post that meets the requirements:\n\n**Home Decor Inspiration: Top 5 Handicraft Bamboo Table Vases for Summer**\n\nAs the summer months approach, our homes become the perfect canvas for adding decorative elements that bring warmth and character to our living spaces. One of the most stylish and eco-friendly ways to enhance your home decor is by incorporating a beautiful handicraft bamboo table vase into your collection.\n\n**Why Choose Handicraft Bamboo Table Vases?**\n\nMade from natural, sustainable materials, these stunning vases are not only visually appealing but also promote a healthier indoor environment. Bamboo is a highly renewable resource that requires minimal processing and has excellent insulation properties, making it an ideal choice for home decor.\n\nEach of the top 5 handicraft bamboo table vases featured in this article showcases unique craftsmanship and attention to detail, ensuring that every piece stands out from the rest. Whether you\'re looking for a subtle accent or a show-stopping centerpiece, these handcrafted vases will elevate your home\'s décor and add a touch of elegance.\n\n**The Top 5 Handicraft Bamboo Table Vases for Summer**\n\n1. **Portronics MODESK Universal Mobile Holder Stand**\n2. **Noise Vortex Plus Smartwatch**\n3. **MOTOHUB VR BOX**\n4. **Fastrack Jupiter S1 Smartwatch**\n5. **FRONTECH Wired Mini Keyboard**\n\n**Each of these vases offers a distinct charm, but they all share a common thread – their natural, earthy beauty and eco-friendly credentials. By incorporating one of these handcrafted bamboo table vases into your home decor, you\'ll be creating a space that not only looks stunning but also promotes sustainability.\n\nWhether you\'re looking to add a touch of whimsy or a sophisticated accent, our top 5 handicraft bamboo table vases are sure to inspire and delight. So why wait? Discover the perfect vase for your summer home today!\n\n**Conclusion**\n\nHandicraft bamboo table vases are not only a stylish addition to any room but also an eco-friendly way to enhance your home decor. With their natural beauty, unique craftsmanship, and sustainable credentials, these vases are sure to become a centerpiece in your home. By incorporating one of our top 5 handicraft bamboo table vases into your collection, you\'ll be creating a space that not only looks stunning but also promotes sustainability.\n\nAs the summer months approach, why not give your home decor a refreshing twist? Look no further than our top 5 handicraft bamboo table vases – each one carefully crafted to bring warmth and character to your living space.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Home Decor Inspiration: Top 5 Handicraft Bamboo Table Vases for Summer', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Here\'s a well-researched and ...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting, vases, bamboo, table, handicraft, decor', 1, 1, '2025-11-25 17:48:14', '2025-11-25 17:57:17', 1, 10117);
INSERT INTO `blog` (`id`, `title`, `slug`, `content`, `image`, `imageAlt`, `metaTitle`, `metaDescription`, `metaKeywords`, `status`, `authorId`, `createdAt`, `updatedAt`, `isAutoGenerated`, `sourceProductId`) VALUES
(25, 'What Makes the Perfect Handicraft Bamboo Table Vase for You?', 'handicraft-bamboo-table-vase-8-inch-handmade-brown-eco-friendly-decorative-bamboo-flower-vase-for-ho-9', '<a href=\"https://ipshopy.com/assam-cane-handicraft-bamboo-table-vase-8-inch\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10117\" class=\"product-link\">Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting</a>\r\n\r\nEnhance your living space with the elegance of the handicraft bamboo table vase. Measuring 8 inches in height, this handmade bamboo flower vase brings a rustic yet sophisticated charm to your home décor. Its natural brown shade complements modern and traditional interiors alike, making it a perfect addition for tables, showcases, or living room corners.\r\n\r\nCrafted by skilled artisans, this eco-friendly bamboo decorative vase is designed to be both sustainable and visually appealing. The use of natural materials ensures that this product is not only environmentally friendly but also free from harsh chemicals and toxins. With its intricate design, the handicraft bamboo table vase adds a unique touch to any room.\r\n\r\nThe 8-inch height makes it suitable for various spaces, such as tables, shelves, or even corner decorations. Its sturdy construction ensures that it will withstand regular use without compromising on durability. The natural brown color also provides a warm and inviting ambiance to any room.\r\n\r\nIncorporating this handicraft bamboo table vase into your home décor can add a touch of elegance and sophistication. Its eco-friendly features make it an excellent choice for those who prioritize the environment and sustainability. Whether you\'re looking to upgrade your existing decor or start from scratch, this handmade bamboo flower vase is sure to impress.\r\n\r\nTo ensure that you get the best value for your money, consider pairing it with other items in your home décor. The handicraft bamboo table vase can complement a variety of styles, making it an excellent addition to any room. So why wait? Upgrade your space today and experience the beauty of handmade craftsmanship.\r\n\r\nFor sun protection, consider our Suncream Products collection. Made from high-quality materials, these products provide excellent protection without compromising on style or performance. With a wide range of options available, you\'re sure to find the perfect sunscreen for your needs.', 'https://ipshopy.com/image/catalog/product/bamboo1_2025-09-20_11-29-24_123638_2025-09-20_11-05-12_966930.jpg', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - What Makes the Perfect Handicraft Bamboo Table Vase for You?', 'Handicraft Bamboo Table Va | Products | ipshopy.com', 'Discover Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting - Handicraft Bamboo Table Vase ...', 'Handicraft Bamboo Table Vase | 8 Inch Handmade Brown | Eco-Friendly Decorative Bamboo Flower Vase for Home & Gifting,bamboo,handicraft,table,handmade,brown', 1, 1, '2025-11-25 17:51:10', '2025-11-25 18:01:25', 1, 10117),
(26, 'keyboard', 'keyboard', '<h2>Wired Keyboard: Why the Old School Connection Still Reigns Supreme</h2><p></p><p>In a world increasingly dominated by sleek, battery-powered peripherals, the humble wired keyboard often gets relegated to the \"old tech\" bin. Yet, for gamers, programmers, and efficiency-focused professionals, the coiled cable is more than just a tether—it’s a feature. The wired keyboard remains a bastion of reliability, speed, and customization, proving that sometimes, the simplest connection is the best connection.</p><p><strong>The Unbeatable Trinity: Speed, Reliability, and Zero Latency</strong></p><p>The primary advantage of a wired keyboard is its <strong>uncompromised performance</strong>. When you press a key on a wired board, that signal travels directly through a dedicated cable connection (USB or PS/2) to your computer. This direct path results in a near-zero latency, meaning the time delay between the key press and the character appearing on screen is virtually instantaneous.</p><p>For gamers, particularly those playing competitive esports, this millisecond difference can determine a win or loss. While modern wireless keyboards have significantly closed this gap, they still rely on radio frequencies (like Bluetooth or 2.4 GHz dongles) which are susceptible to interference from other wireless devices, Wi-Fi routers, or even physical obstructions. A wired connection eliminates this risk entirely, guaranteeing a stable, consistent input experience. You never have to worry about a dropped signal during a critical moment.</p><p><strong>The Power of Simplicity (No Batteries Required)</strong></p><p>One of the biggest conveniences of a wired setup is the removal of the battery management headache. Forget about constantly monitoring charge levels, carrying spare batteries, or having your keyboard die mid-sentence. Wired keyboards draw their power directly from the computer, offering endless, uninterrupted use. This simplicity also contributes to longevity; there are fewer internal components (like batteries and complex wireless transmitters) that can fail over time.</p><p><strong>The Mechanical Advantage and Customization</strong></p><p>Wired keyboards are the preferred platform for high-end <strong>mechanical keyboards</strong>. The direct power delivery supports robust features like N-Key Rollover (NKRO), which ensures every single key press is registered, no matter how many keys you hit simultaneously—an essential feature for touch typists and serious gamers. Furthermore, the stable, continuous power allows for bright, customizable RGB lighting without worrying about draining a battery quickly. Enthusiasts appreciate that wired connections simplify the engineering, allowing more focus on premium switches, keycaps, and durable chassis designs.</p><p>In summary, the wired keyboard is a statement: it prioritizes performance and reliability above all else. By trading in a few feet of wireless freedom, you gain an unbreakable, low-latency connection that enhances every task, whether you\'re compiling code, crafting documents, or achieving that final boss kill. For the discerning user, the wire isn\'t a limitation; it\'s a link to peak performance.</p>', 'https://res.cloudinary.com/umar001/image/upload/v1764082176/blog-images/gaghe5ooroddiorygtjy.jpg', '', 'keyboard', 'Wired Keyboard: Why the Old School Connection Still Reigns Supreme\r\nIn a world increasingly dominated by sleek, battery-powered peripherals, the humble wired keyboard often gets relegated to the \"old tech\" bin. Yet, for gamers, programmers, and efficiency-focused professionals, the coiled cable is more than just a tether—it’s a feature. The wired keyboard remains a bastion of reliability, ', 'keyboard', 1, 1, '2025-11-25 20:19:38', '2025-11-26 16:31:03', 0, NULL),
(27, 'Adhesive Shower Hooks Pack Of 10 Guide to Choosing the Best Option\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-4', '**Adhesive Shower Hooks Pack Of 10 Guide to Choosing the Best Option**\n\nUpgrade your bathroom and kitchen organization with our 10Pack Adhesive Shower Hooks, designed to hold your essentials securely without drilling or nails. These self-adhesive wall hooks are perfect for hanging towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces.\n\nThe transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look. Our adhesive hooks are made from high-quality materials that ensure durability and easy installation. With their adjustable mechanism, you can hang items of varying sizes without worrying about them falling off.\n\nWhen selecting the best option for your needs, consider the following features:\n\n* Adhesive hooks: Look for hooks with a strong adhesive that can withstand heavy loads.\n* Shower hooks: Choose hooks specifically designed for showers to prevent water damage and ensure a secure hold.\n* Waterproofing: Opt for waterproof options to protect against moisture and corrosion.\n* Durability: Select durable materials and construction to extend the life of your hooks.\n\nAt Brand Name], we offer an extensive range of adhesive shower hooks in various colors, sizes, and designs. Our products are designed to meet the needs of both residential and commercial users. With our innovative self-adhesive technology, you can say goodbye to drilling or nails and hello to a hassle-free installation process.\n\nWhether you\'re looking for a stylish addition to your bathroom or kitchen, our adhesive shower hooks pack of 10 is an excellent choice. By choosing the best option for your needs, you\'ll not only enhance the functionality of your space but also ensure long-lasting durability and reliability.\n\nTo help you make an informed decision, we\'ve compiled a list of key features to consider:\n\n* Adhesive hook type: Self-adhesive or screw-in\n* Material: Durable materials like stainless steel or aluminum\n* Size: Choose hooks that fit your specific needs\n* Color: Select a color that complements your décor\n\nBy considering these factors and our extensive range of products, you\'ll find the perfect adhesive shower hooks pack for your bathroom or kitchen. Visit us today to explore our collection and discover how our innovative technology can transform your space.\n\nFor sun protection, consider our [Suncream Products collection. Our high-quality sunscreen provides long-lasting protection against UV rays. With its lightweight and non-greasy texture, it\'s perfect for daily use.\n\nDon\'t compromise on quality when it comes to kitchen utensils. Opt for durable materials like stainless steel or silicone to ensure they withstand heavy use. Our Kitchen Utensil Products collection offers a wide range of options to suit your needs.\n\nAt [Brand Name], we\'re committed to providing the best possible products and services. If you have any questions or require further assistance, please don\'t hesitate to contact us.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Adhesive Shower Hooks Pack Of 10 Guide to Choosing the Best Option\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, hooks, adhesive, shower, kitchen, materials', 1, 1, '2025-11-27 12:10:04', '2025-11-27 19:19:57', 1, 10118),
(28, 'Top 5 Things You Need to Know About Adhesive Shower Hooks\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-5', '**Top 5 Things You Need to Know About Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install**\n\nAs we enter the new season, our bathroom and kitchen organization needs are about to become even more pressing. One essential item that can significantly enhance your daily routine is the adhesive shower hooks pack of ten. In this article, we will break down the key features, benefits, and installation requirements for these handy products.\n\n**Introduction (200-300 chars)**\n\nWhen it comes to bathroom and kitchen organization, having a reliable and versatile storage solution is crucial. Adhesive shower hooks are an excellent option for hanging towels, shower caddies, utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces without drilling or nails.\n\n**Main Content (1000-1400 chars)**\n\nAdhesive shower hooks are designed to provide a secure hold on various materials, making them perfect for installation in bathrooms and kitchens. The transparent design ensures they blend seamlessly with the décor, giving a clean and elegant look.\n\nWhen selecting an adhesive shower hook set, consider the following factors:\n\n* Material: Available in a range of materials, including metal, glass, and plastic.\n* Adhesive strength: Ensure it can withstand the weight and moisture of your bathroom or kitchen.\n* Installation options: Consider whether you need to drill holes or use a pre-drilled anchor.\n\nThe benefits of adhesive shower hooks include:\n\n* Convenience: No drilling or nails required\n* Durability: Can hold heavy loads without compromising the integrity of the material\n* Easy installation: Simply peel and stick\n\n**Conclusion (200-300 chars)**\n\nIn conclusion, the adhesive shower hooks pack of ten are a practical and versatile solution for bathroom and kitchen organization. By considering factors such as material, adhesive strength, and installation options, you can make an informed decision when selecting these handy products.\n\nTo get started, visit our website to explore our range of adhesive shower hooks in various categories, including CATEGORY_NAME. Whether you\'re looking for a waterproof solution or a self-adhesive option, we\'ve got you covered.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Top 5 Things You Need to Know About Adhesive Shower Hooks\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, adhesive, shower, hooks, bathroom, kitchen', 1, 1, '2025-11-27 12:12:21', '2025-11-27 19:19:57', 1, 10118),
(29, 'Review and Comparison: Adhesive Shower Hooks vs Traditional Hooks\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-6', 'Review and Comparison: Adhesive Shower Hooks vs Traditional Hooks\n\nWhen it comes to upgrading your bathroom and kitchen organization, there are several options available in the market. Two of the most popular choices are adhesive shower hooks and traditional hooks. In this review and comparison, we will delve into the features, benefits, and drawbacks of each option to help you make an informed decision.\n\nAdhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install\n\nThe adhesive shower hooks are a great alternative to traditional hooks. These self-adhesive wall mount corner shelves are perfect for hanging towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces. The transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look.\n\nOne of the standout features of these hooks is their ease of installation. They come with adhesive strips that can be applied directly to the wall, eliminating the need for drilling or nails. This not only saves time but also reduces mess and damage to the surface.\n\nAnother advantage of these hooks is their durability. The self-adhesive material is designed to withstand heavy use and last for a long period without losing its adhesion. Additionally, they are easy to clean and maintain, making them a great choice for households with multiple users.\n\nHowever, one potential drawback of these hooks is the limited flexibility in terms of installation. While they can be applied directly to any smooth surface, they may not be suitable for surfaces with complex curves or irregular shapes.\n\nIn contrast, traditional hooks offer more flexibility when it comes to installation. They can be screwed into place using screws and nails, providing a more secure hold on the wall. However, this method requires more effort and time, which may make them less appealing to those who value convenience.\n\nWhen choosing between these two options, consider your specific needs and preferences. If you\'re looking for a quick and easy installation solution with a focus on durability and ease of maintenance, adhesive shower hooks might be the better choice. However, if you prefer a more traditional approach with flexibility in terms of installation, traditional hooks could be the way to go.\n\nConclusion:\n\nIn conclusion, adhesive shower hooks are a great alternative to traditional hooks when it comes to upgrading your bathroom and kitchen organization. Their ease of installation, durability, and ease of maintenance make them an attractive option for those who value convenience and practicality. While they may not offer as much flexibility in terms of installation, their transparent design ensures they blend seamlessly with your décor.\n\nWhen shopping for adhesive shower hooks, be sure to check the product specifications and reviews from other customers to get a better understanding of what to expect. With their long-lasting adhesion and easy-to-clean design, these hooks are sure to provide years of reliable service.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - Review and Comparison: Adhesive Shower Hooks vs Traditional Hooks\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, hooks, adhesive, shower, traditional, kitchen', 1, 1, '2025-11-27 12:14:50', '2025-11-27 19:19:57', 1, 10118),
(30, 'The Ultimate Buying Guide to Adhesive Shower Hooks\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-7', 'The Ultimate Buying Guide to Adhesive Shower Hooks Pack Of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install\n\nWhen it comes to upgrading your bathroom and kitchen organization with the right tools, adhesive shower hooks are a fantastic starting point. These innovative products offer not only functionality but also durability and ease of installation, making them an excellent choice for any homeowner or professional looking to enhance their space.\n\nAdhesive shower hooks are specifically designed to hold items securely without drilling or nails, allowing you to hang towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces. The transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look that adds a touch of sophistication to any bathroom or kitchen.\n\nOne of the standout features of adhesive shower hooks is their waterproof properties. These products are engineered to withstand harsh environments and can be used in bathrooms and kitchens where moisture is present. The self-adhesive material makes installation a breeze, eliminating the need for additional adhesives or fasteners.\n\nIn addition to their practical benefits, adhesive shower hooks also offer several advantages over traditional hooking methods. They provide a more secure hold, reducing the risk of items falling off or being damaged during use. Furthermore, they are often easier to install and remove, making them a convenient option for frequent users.\n\nWhen choosing the right adhesive shower hooks for your needs, it\'s essential to consider the weight and size of the items you plan to hang. Look for products with a sturdy adhesive strip that can hold even the heaviest loads. Additionally, choose a product with a durable finish that will withstand repeated use and cleaning.\n\nIn conclusion, adhesive shower hooks are an excellent addition to any bathroom or kitchen organization. With their waterproof properties, self-adhesive material, and ease of installation, they offer a range of benefits that make them an ideal choice for homeowners and professionals alike. Whether you\'re looking to upgrade your current setup or start from scratch, these innovative products are sure to provide a seamless and functional experience.\n\nFor sun protection, consider our Suncream Products collection for the best options available.\n\nWhen it comes to choosing the right adhesive shower hooks, look for products with a sturdy adhesive strip that can hold even the heaviest loads. Additionally, choose a product with a durable finish that will withstand repeated use and cleaning.\n\nBy following these tips and considering your specific needs, you\'ll be able to find the perfect adhesive shower hooks for your bathroom or kitchen organization. With their waterproof properties, self-adhesive material, and ease of installation, they offer a range of benefits that make them an ideal choice for homeowners and professionals alike.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - The Ultimate Buying Guide to Adhesive Shower Hooks\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, adhesive, shower, hooks, products, bathroom', 1, 1, '2025-11-27 12:17:41', '2025-11-27 19:19:57', 1, 10118),
(31, 'How to Install Adhesive Shower Hooks Like a Pro\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-8', '**How to Install Adhesive Shower Hooks Like a Pro**\n\nAre you tired of drilling holes in your bathroom walls or kitchen tiles? Do you want to upgrade your bathroom and kitchen organization without breaking the bank? Look no further than our adhesive shower hooks pack of 10! These self-adhesive wall mount corner shelves are perfect for hanging towels, shower caddies, kitchen utensils, and other lightweight items on smooth surfaces.\n\nOur adhesive shower hooks are designed to hold a surprising amount of weight, making them ideal for heavy-duty use. The transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look. Plus, the easy installation process makes it simple to get started right away.\n\n**Key Features:**\n\n* Waterproof and durable\n* Easy to install on smooth surfaces\n* Holds up to 10 kg (22 lbs) of weight\n* Available in transparent and opaque designs\n* Perfect for bathroom and kitchen organization\n\n**Installation Guide:**\n\nTo get the most out of your adhesive shower hooks, follow these easy installation steps:\n\n1. Choose a suitable surface: Make sure the wall or tile is smooth and flat.\n2. Clean the area: Thoroughly clean the surface to ensure good adhesion.\n3. Apply the hook: Peel off the backing and attach the hook to the wall or tile.\n4. Hang your item: Place your towel, shower caddy, or utensil on the hook.\n\n**Benefits of Our Adhesive Shower Hooks:**\n\n* No drilling or nails required\n* Easy to install and remove\n* Durable and long-lasting\n* Perfect for heavy-duty use\n* Available in transparent and opaque designs\n\nWhether you\'re looking to upgrade your bathroom or kitchen organization, our adhesive shower hooks pack of 10 are the perfect solution. With their waterproof and durable design, easy installation process, and weight capacity of up to 10 kg (22 lbs), you can trust that our products will hold up to heavy use.\n\n**Conclusion:**\n\nOur adhesive shower hooks pack of 10 are a game-changer for anyone looking to upgrade their bathroom or kitchen organization. With their transparent and opaque designs, easy installation process, and durable construction, these hooks are perfect for anyone on a budget. Don\'t settle for subpar products – choose our adhesive shower hooks today!\n\n**Call-to-Action:**\n\nReady to get started? Order now and take advantage of our limited-time discount! TEXT', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - How to Install Adhesive Shower Hooks Like a Pro\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, shower, adhesive, hooks, kitchen, bathroom', 1, 1, '2025-11-27 12:20:01', '2025-11-27 19:19:57', 1, 10118),
(32, 'The Importance of Considerations When Purchasing Adhesive Shower Hooks\",', 'adhesive-shower-hooks-pack-of-10-self-adhesive-wall-mount-corner-shelf-waterproof-bathroom-kitchen-w-9', 'The Importance of Considerations When Purchasing Adhesive Shower Hooks\n\nAs we continue to prioritize sustainability and comfort in our daily lives, it\'s essential to look into innovative products that cater to our needs without compromising on quality or functionality. One such product is the adhesive shower hooks pack of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install.\n\nThese self-adhesive wall hooks are a game-changer for homeowners and renters alike. They offer a convenient and space-saving solution for hanging towels, shower caddies, kitchen utensils, and other lightweight items on tiles, metal, glass, or smooth surfaces. The transparent design ensures they blend seamlessly with your décor, giving a clean and elegant look.\n\nWhen choosing an adhesive shower hooks pack of 10, consider the following factors:\n\n1. **Adhesive strength**: Ensure the adhesive is strong enough to hold heavy items without compromising on ease of installation.\n2. **Surface compatibility**: Check if the adhesive can bond well with various surfaces, including tiles, metal, glass, and smooth finishes.\n3. **Durability**: Assess the product\'s durability in high-traffic areas or for extended use.\n4. **Easy installation**: Look for products that are easy to install, even for DIY enthusiasts.\n\nBy considering these factors, you can make an informed decision when selecting the adhesive shower hooks pack of 10 | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install.\n\nIn conclusion, these adhesive shower hooks are a fantastic addition to any bathroom or kitchen. They offer a convenient and stylish solution for hanging essentials while maintaining their durability and ease of installation. With this product in your arsenal, you\'ll be able to create a clutter-free and organized space that suits your lifestyle perfectly.', 'https://ipshopy.com/image/catalog/product/0vu7a_512_cleanup_2025-09-20_11-31-49_172345_2025-09-20_06-18-57_301509.png', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install - The Importance of Considerations When Purchasing Adhesive Shower Hooks\",', 'Adhesive Shower Hooks Pack | Products | ipshopy.com', 'Discover Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy In...', 'Adhesive Shower Hooks Pack Of 10  | Self Adhesive Wall Mount Corner Shelf | Waterproof Bathroom & Kitchen Wall Hooks | Transparent, Durable, Easy Install, adhesive, hooks, shower, bathroom, kitchen', 1, 1, '2025-11-27 12:22:00', '2025-11-27 19:19:57', 1, 10118),
(33, 'ENSURE High Protein Health Drink, Chocolate 200g | The Ultimate Guide to Muscle Recovery and Meal Replacement\",', 'ensure-high-protein-health-drink-chocolate-200g-protein-drink-for-active-adults-muscle-recovery-meal', '**ENSURE High Protein Health Drink, Chocolate 200g | The Ultimate Guide to Muscle Recovery and Meal Replacement**\n\nAs an active adult or fitness enthusiast, you\'re likely no stranger to the challenges of maintaining a healthy lifestyle. One area where protein plays a crucial role is in muscle recovery and meal replacement. That\'s where ENSURE comes in – a high-quality, chocolate-flavored health drink specifically designed for active adults.\n\n**What sets ENSURE apart?**\n\nENsure is scientifically formulated with a unique blend of essential amino acids, vitamins, and minerals that work synergistically to support muscle recovery and overall wellness. Our proprietary technology ensures maximum protein absorption, leaving you feeling energized and focused throughout the day.\n\n**Key benefits:**\n\n* High-quality protein for muscle repair and growth\n* Rich in vitamins and minerals for optimal health\n* Convenient and easy to digest\n* Perfect for post-workout nutrition or as a meal replacement supplement\n\n**What does ENSURE taste like?**\n\nOur chocolate-flavored drink is smooth, rich, and indulgent. The perfect complement to your favorite workouts or meals.\n\n**Conclusion:**\n\n<a href=\"https://ipshopy.com/ensure-high-protein-health-drink-chocolate-200g-adults\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10119\" class=\"product-link\">ENsure High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement</a> is the ultimate solution for those looking to optimize their fitness journey. With its unique blend of nutrients and easy-to-digest formula, ENSURE is the perfect choice for anyone seeking a reliable partner in muscle recovery and meal replacement.\n\n**Hyperlinks:**\n\n* ENsure for more information\n* Category Products to explore our full range of products', 'https://ipshopy.com/image/catalog/product/ENSURE-High-Protein-200g-1_2025-09-20_11-34-46_331602_2025-09-20_06-08-33_985883.jpg', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - ENSURE High Protein Health Drink, Chocolate 200g | The Ultimate Guide to Muscle Recovery and Meal Replacement\",', 'ENSURE High Protein Health | Products | ipshopy.com', 'Discover ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - **ENSURE High Protein Heal...', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement, ensure, protein, muscle, recovery, health', 1, 1, '2025-11-27 13:12:39', '2025-11-27 19:19:57', 1, 10119),
(34, 'ENSURE High Protein Health Drink, Chocolate 200g | A Comprehensive Review of its Benefits and Effects on Fitness\",', 'ensure-high-protein-health-drink-chocolate-200g-protein-drink-for-active-adults-muscle-recovery-meal-1', '**ENSURE High Protein Health Drink, Chocolate 200g | A Comprehensive Review of its Benefits and Effects on Fitness**\n\nAs an active adult, you\'re always looking for ways to fuel your body with the right nutrients. One product that has been gaining popularity in recent times is ENSURE High Protein Health Drink, Chocolate 200g, specifically designed for muscle recovery and meal replacement. In this review, we\'ll delve into the benefits of this product and explore its features.\n\n**Introduction**\nWhen it comes to achieving optimal fitness, protein plays a crucial role. As athletes or individuals who engage in regular physical activity, it\'s essential to consume sufficient amounts of protein to support muscle growth and repair. ENSURE High Protein Health Drink, Chocolate 200g, is a scientifically formulated drink designed specifically for high-performance individuals.\n\n**Features**\n\n*   **High-quality protein**: This chocolate-flavored drink is packed with high-quality protein, ideal for muscle recovery and meal replacement.\n*   **Muscle recovery**: With its unique blend of amino acids, ENSURE High Protein Health Drink helps to promote muscle recovery after intense workouts.\n*   **Meal replacement**: As a convenient option, this product can be used as a meal replacement, providing all the necessary nutrients for optimal performance.\n\n**Benefits**\nProtein is an essential nutrient that plays a vital role in various bodily functions. When consumed, protein helps to:\n\n*   Promote muscle growth and repair\n*   Support bone health\n*   Enhance overall fitness and athletic performance\n\nBy incorporating ENSURE High Protein Health Drink into your daily routine, you can reap the benefits of high-quality protein and support optimal muscle recovery.\n\n**Conclusion**\nIn conclusion, ENSURE High Protein Health Drink, Chocolate 200g, is a product that has been designed specifically for individuals who require high levels of protein to achieve optimal fitness. With its unique blend of amino acids and high-quality protein, this drink can help promote muscle recovery and support meal replacement needs.\n\nWhen selecting a protein supplement, look for products that are:\n\n*   High in quality protein\n*   Formulated for specific uses (e.g., post-workout or meal replacement)\n*   Made with all-natural ingredients\n\nBy choosing the right product, you can ensure optimal performance and support your fitness goals.', 'https://ipshopy.com/image/catalog/product/ENSURE-High-Protein-200g-1_2025-09-20_11-34-46_331602_2025-09-20_06-08-33_985883.jpg', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - ENSURE High Protein Health Drink, Chocolate 200g | A Comprehensive Review of its Benefits and Effects on Fitness\",', 'ENSURE High Protein Health | Products | ipshopy.com', 'Discover ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - **ENSURE High Protein Heal...', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement, protein, health, muscle, ensure, optimal', 1, 1, '2025-11-27 13:15:06', '2025-11-27 19:19:57', 1, 10119),
(35, 'Why Choose ENSURE High Protein Health Drink, Chocolate 200g | For Active Adults Looking for Optimal Nutrition\",', 'ensure-high-protein-health-drink-chocolate-200g-protein-drink-for-active-adults-muscle-recovery-meal-2', 'Here is a professional and informative blog post based on the article title:\n\n**Why Choose ENSURE High Protein Health Drink, Chocolate 200g | For Active Adults Looking for Optimal Nutrition**\n\nAs an active adult, you know that staying healthy and fit is essential to living a balanced life. One of the most important aspects of fitness is nutrition, and that\'s where ENSURE comes in – a high protein health drink designed specifically for active adults like you.\n\n**What Sets ENSURE Apart**\n\nWith its unique blend of high-quality protein, vitamins, and minerals, ENSURE provides essential nutrients to support muscle recovery, weight management, and overall wellness. This chocolate-flavored drink is packed with 200g of the goodness, making it an ideal solution for those looking to boost their energy levels and support their fitness goals.\n\n**A Closer Look at the Benefits**\n\nProtein plays a crucial role in muscle recovery, which is why ENSURE is perfect for active adults who engage in regular exercise or sports. The high protein content helps to repair and rebuild muscles, promoting faster recovery time. Additionally, ENSURE\'s balanced mix of vitamins and minerals supports overall health and wellness.\n\n**A Healthy Lifestyle with ENSURE**\n\nFor those looking to incorporate a healthy lifestyle into their daily routine, ENSURE is an excellent choice. By including ENSURE in your fitness regimen, you can:\n\n* Support muscle recovery after intense workouts\n* Boost energy levels for daily activities\n* Promote overall health and wellness\n\n**Conclusion**\n\nIn conclusion, <a href=\"https://ipshopy.com/ensure-high-protein-health-drink-chocolate-200g-adults\" target=\"_blank\" rel=\"noopener noreferrer\" data-product-id=\"10119\" class=\"product-link\">ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement</a> is an excellent choice for anyone looking to take their fitness journey to the next level. With its unique blend of high-quality protein, vitamins, and minerals, this drink provides essential nutrients to support muscle recovery, weight management, and overall wellness.\n\n**Call-to-Action**\n\nSo why wait? Try ENSURE today and experience the benefits of a healthy and fit lifestyle. Visit our website or store to learn more about this amazing product and start your fitness journey with confidence!', 'https://ipshopy.com/image/catalog/product/ENSURE-High-Protein-200g-1_2025-09-20_11-34-46_331602_2025-09-20_06-08-33_985883.jpg', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - Why Choose ENSURE High Protein Health Drink, Chocolate 200g | For Active Adults Looking for Optimal Nutrition\",', 'ENSURE High Protein Health | Products | ipshopy.com', 'Discover ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement - Here is a professional and...', 'ENSURE High Protein Health Drink, Chocolate 200g | Protein Drink for Active Adults | Muscle Recovery & Meal Replacement, ensure, protein, health, active, fitness', 1, 1, '2025-11-27 13:17:39', '2025-11-27 19:19:57', 1, 10119);

-- --------------------------------------------------------

--
-- Table structure for table `blogcategory`
--

CREATE TABLE `blogcategory` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogcategory`
--

INSERT INTO `blogcategory` (`id`, `blogId`, `categoryId`) VALUES
(14, 17, 4),
(10, 19, 4),
(13, 20, 4),
(11, 25, 5),
(12, 26, 4);

-- --------------------------------------------------------

--
-- Table structure for table `blogevent`
--

CREATE TABLE `blogevent` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloggenerationlog`
--

CREATE TABLE `bloggenerationlog` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `status` enum('started','content_generated','validated','seo_optimized','created','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentLength` int(11) DEFAULT NULL,
  `validationScore` int(11) DEFAULT NULL,
  `seoScore` int(11) DEFAULT NULL,
  `errorMessage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processingTime` int(11) DEFAULT NULL,
  `aiModel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aiTokensUsed` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogproduct`
--

CREATE TABLE `blogproduct` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `linkType` enum('featured','mentioned','related','comparison') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mentioned',
  `position` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogrelation`
--

CREATE TABLE `blogrelation` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `relatedBlogId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `isHelpCategory` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `description`, `image`, `createdAt`, `updatedAt`, `status`, `isHelpCategory`) VALUES
(4, 'electronics', 'electronics', 'electronic', 'https://res.cloudinary.com/umar001/image/upload/v1764073525/blog-images/rcp0d5sgq1vxg5gcfck3.jpg', '2025-11-25 17:55:26', '2025-11-25 17:56:29', 1, 0),
(5, 'dog food', 'dog-food', 'dog food', 'https://res.cloudinary.com/umar001/image/upload/v1764073829/blog-images/e65nc3mv8oy80azhwm8r.jpg', '2025-11-25 18:00:31', '2025-11-25 18:00:40', 1, 0),
(6, 'customer', 'customer', 'customer', 'https://res.cloudinary.com/umar001/image/upload/v1764154224/blog-images/jbrtx4oepggr0d4zqkyd.jpg', '2025-11-25 19:29:58', '2025-11-26 16:21:10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blogId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parentId` int(11) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `isBlocked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `blogId`, `userId`, `createdAt`, `updatedAt`, `parentId`, `status`, `isBlocked`) VALUES
(3, 'nice', 23, 1, '2025-11-25 20:12:29', '2025-11-25 20:12:29', NULL, 'approved', 0),
(4, 'nice blog', 25, 1, '2025-11-27 12:17:28', '2025-11-27 12:17:28', NULL, 'approved', 0),
(5, 'thanks', 25, 1, '2025-11-27 12:18:08', '2025-11-27 12:18:08', 4, 'approved', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contentvalidationrule`
--

CREATE TABLE `contentvalidationrule` (
  `id` int(11) NOT NULL,
  `ruleName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruleType` enum('blocklist','regex','ai_check','length','seo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruleConfig` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` enum('error','warning','info') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'error',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventUrl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('upcoming','live','past') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'upcoming',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `slug`, `description`, `image`, `startDate`, `endDate`, `location`, `eventUrl`, `status`, `featured`, `createdAt`, `updatedAt`) VALUES
(1, 'The Winter Wonderland Gala', 'The-Winter-Wonderland-Gala', 'The Winter Wonderland Gala', 'data:image/jpeg;base64,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', '2025-11-29 19:01:00', '2025-11-30 19:21:00', '', 'https://www.ipshopy.com/electronics-online', '', 1, '2025-11-25 19:22:05', '2025-11-27 10:14:57'),
(2, 'new', 'new', 'new', 'data:image/jpeg;base64,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', '2025-11-25 17:44:00', '2025-11-28 17:44:00', '', '', 'live', 1, '2025-11-26 17:45:03', '2025-11-27 11:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `question` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generationcost`
--

CREATE TABLE `generationcost` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `providerName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokensUsed` int(11) DEFAULT 0,
  `requestsCount` int(11) DEFAULT 0,
  `totalCost` decimal(10,4) DEFAULT 0.0000,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generationexclusion`
--

CREATE TABLE `generationexclusion` (
  `id` int(11) NOT NULL,
  `exclusionType` enum('product','category') COLLATE utf8mb4_unicode_ci NOT NULL,
  `targetId` int(11) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excludedBy` int(11) NOT NULL,
  `excludedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `expiresAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generationqueue`
--

CREATE TABLE `generationqueue` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `queueType` enum('titles','articles','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 50,
  `status` enum('pending','processing','completed','failed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `scheduledAt` datetime DEFAULT NULL,
  `startedAt` datetime DEFAULT NULL,
  `completedAt` datetime DEFAULT NULL,
  `errorMessage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retryCount` int(11) DEFAULT 0,
  `maxRetries` int(11) DEFAULT 3,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generationsettings`
--

CREATE TABLE `generationsettings` (
  `id` int(11) NOT NULL,
  `settingKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingValue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingType` enum('string','number','boolean','json','array') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informationprivacypolicy`
--

CREATE TABLE `informationprivacypolicy` (
  `id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passwordresettoken`
--

CREATE TABLE `passwordresettoken` (
  `id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipshopyUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `rating` decimal(3,2) DEFAULT 0.00,
  `reviewCount` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productarticletitle`
--

CREATE TABLE `productarticletitle` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `articleNumber` int(11) NOT NULL,
  `status` enum('pending','generated','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `seoScore` int(11) DEFAULT 0,
  `generatedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productblog`
--

CREATE TABLE `productblog` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `articleTitleId` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `generationStatus` enum('pending','generating','completed','failed','review_required') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `generationMethod` enum('auto','manual','regenerated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto',
  `contentScore` int(11) DEFAULT 0,
  `seoScore` int(11) DEFAULT 0,
  `hyperlinkCount` int(11) DEFAULT 0,
  `validationErrors` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generatedAt` datetime DEFAULT NULL,
  `reviewedAt` datetime DEFAULT NULL,
  `reviewedBy` int(11) DEFAULT NULL,
  `reviewNotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productblogpriority`
--

CREATE TABLE `productblogpriority` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `blogId` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 50,
  `alwaysShow` tinyint(1) NOT NULL DEFAULT 0,
  `neverShow` tinyint(1) NOT NULL DEFAULT 0,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiresAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productcategorypriority`
--

CREATE TABLE `productcategorypriority` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 50,
  `boost` decimal(3,2) DEFAULT 1.00,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productclick`
--

CREATE TABLE `productclick` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `blogId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clickedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productindex`
--

CREATE TABLE `productindex` (
  `id` int(11) NOT NULL,
  `ipshopyProductId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockStatus` enum('in_stock','out_of_stock','preorder') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT 0.00,
  `reviewCount` int(11) DEFAULT 0,
  `popularityScore` int(11) DEFAULT 0,
  `adminPriority` int(11) NOT NULL DEFAULT 50,
  `ipshopyUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastSyncedAt` datetime DEFAULT NULL,
  `syncStatus` enum('active','inactive','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `syncError` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productperformance`
--

CREATE TABLE `productperformance` (
  `id` int(11) NOT NULL,
  `productIndexId` int(11) NOT NULL,
  `blogId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `impressions` int(11) DEFAULT 0,
  `clicks` int(11) DEFAULT 0,
  `conversions` int(11) DEFAULT 0,
  `ctr` decimal(5,4) DEFAULT 0.0000,
  `conversionRate` decimal(5,4) DEFAULT 0.0000,
  `lastCalculatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productsynclog`
--

CREATE TABLE `productsynclog` (
  `id` int(11) NOT NULL,
  `syncType` enum('manual','scheduled','webhook') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('success','error','partial') COLLATE utf8mb4_unicode_ci NOT NULL,
  `productsProcessed` int(11) DEFAULT 0,
  `productsCreated` int(11) DEFAULT 0,
  `productsUpdated` int(11) DEFAULT 0,
  `productsDeleted` int(11) DEFAULT 0,
  `errorMessage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startedAt` datetime NOT NULL,
  `completedAt` datetime DEFAULT NULL,
  `durationSeconds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settingsauditlog`
--

CREATE TABLE `settingsauditlog` (
  `id` int(11) NOT NULL,
  `adminUserId` int(11) NOT NULL,
  `actionType` enum('create','update','delete','activate','deactivate') COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingCategory` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingKey` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oldValue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newValue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitesettings`
--

CREATE TABLE `sitesettings` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userblockedcomment`
--

CREATE TABLE `userblockedcomment` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `blockedBy` int(11) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_provider_account` (`provider`,`providerAccountId`),
  ADD KEY `idx_userId` (`userId`);

--
-- Indexes for table `adcampaign`
--
ALTER TABLE `adcampaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_startDate` (`startDate`),
  ADD KEY `idx_endDate` (`endDate`),
  ADD KEY `idx_priority` (`priority`);

--
-- Indexes for table `adclick`
--
ALTER TABLE `adclick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `idx_adItemId` (`adItemId`),
  ADD KEY `idx_campaignId` (`campaignId`),
  ADD KEY `idx_clickedAt` (`clickedAt`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `adimpression`
--
ALTER TABLE `adimpression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `idx_adItemId` (`adItemId`),
  ADD KEY `idx_campaignId` (`campaignId`),
  ADD KEY `idx_viewedAt` (`viewedAt`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `aditem`
--
ALTER TABLE `aditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaignId` (`campaignId`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_displayOrder` (`displayOrder`),
  ADD KEY `idx_adminPriority` (`adminPriority`);

--
-- Indexes for table `admingroup`
--
ALTER TABLE `admingroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_isSystem` (`isSystem`);

--
-- Indexes for table `admingrouppermission`
--
ALTER TABLE `admingrouppermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_group_route_method` (`groupId`,`route`,`method`),
  ADD KEY `idx_groupId` (`groupId`),
  ADD KEY `idx_route` (`route`);

--
-- Indexes for table `adminotp`
--
ALTER TABLE `adminotp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mobile` (`mobile`),
  ADD KEY `idx_otp` (`otp`),
  ADD KEY `idx_expiresAt` (`expiresAt`),
  ADD KEY `idx_verified` (`verified`);

--
-- Indexes for table `adminuser`
--
ALTER TABLE `adminuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_mobile` (`mobile`);

--
-- Indexes for table `adminusergroup`
--
ALTER TABLE `adminusergroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_group` (`userId`,`groupId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_groupId` (`groupId`);

--
-- Indexes for table `adplacement`
--
ALTER TABLE `adplacement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaignId` (`campaignId`),
  ADD KEY `idx_placementType` (`placementType`);

--
-- Indexes for table `aiproviderconfig`
--
ALTER TABLE `aiproviderconfig`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_providerName` (`providerName`),
  ADD KEY `idx_isActive` (`isActive`),
  ADD KEY `idx_isDefault` (`isDefault`),
  ADD KEY `updatedBy` (`updatedBy`),
  ADD KEY `idx_baseUrl` (`baseUrl`);

--
-- Indexes for table `articlehyperlink`
--
ALTER TABLE `articlehyperlink`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_linkedType` (`linkedType`),
  ADD KEY `idx_linkedId` (`linkedId`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_authorId` (`authorId`),
  ADD KEY `idx_createdAt` (`createdAt`),
  ADD KEY `idx_isAutoGenerated` (`isAutoGenerated`),
  ADD KEY `idx_sourceProductId` (`sourceProductId`);
ALTER TABLE `blog` ADD FULLTEXT KEY `idx_fulltext_title_content` (`title`,`content`);

--
-- Indexes for table `blogcategory`
--
ALTER TABLE `blogcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_blog_category` (`blogId`,`categoryId`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_categoryId` (`categoryId`);

--
-- Indexes for table `blogevent`
--
ALTER TABLE `blogevent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_blog_event` (`blogId`,`eventId`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_eventId` (`eventId`);

--
-- Indexes for table `bloggenerationlog`
--
ALTER TABLE `bloggenerationlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_createdAt` (`createdAt`);

--
-- Indexes for table `blogproduct`
--
ALTER TABLE `blogproduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_blog_product_type` (`blogId`,`productId`,`linkType`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_productId` (`productId`),
  ADD KEY `idx_linkType` (`linkType`);

--
-- Indexes for table `blogrelation`
--
ALTER TABLE `blogrelation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_blog_relation` (`blogId`,`relatedBlogId`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_relatedBlogId` (`relatedBlogId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_isHelpCategory` (`isHelpCategory`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_createdAt` (`createdAt`),
  ADD KEY `parentId` (`parentId`);

--
-- Indexes for table `contentvalidationrule`
--
ALTER TABLE `contentvalidationrule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruleName` (`ruleName`),
  ADD KEY `idx_ruleType` (`ruleType`),
  ADD KEY `idx_isActive` (`isActive`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_featured` (`featured`),
  ADD KEY `idx_startDate` (`startDate`),
  ADD KEY `idx_endDate` (`endDate`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_blog_favorite` (`userId`,`blogId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `generationcost`
--
ALTER TABLE `generationcost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_date_provider` (`date`,`providerName`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_providerName` (`providerName`);

--
-- Indexes for table `generationexclusion`
--
ALTER TABLE `generationexclusion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exclusionType` (`exclusionType`),
  ADD KEY `idx_targetId` (`targetId`),
  ADD KEY `idx_isActive` (`isActive`),
  ADD KEY `excludedBy` (`excludedBy`);

--
-- Indexes for table `generationqueue`
--
ALTER TABLE `generationqueue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_scheduledAt` (`scheduledAt`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `generationsettings`
--
ALTER TABLE `generationsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settingKey` (`settingKey`),
  ADD KEY `idx_settingKey` (`settingKey`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `updatedBy` (`updatedBy`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `informationprivacypolicy`
--
ALTER TABLE `informationprivacypolicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_blog_like` (`userId`,`blogId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `passwordresettoken`
--
ALTER TABLE `passwordresettoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_expiresAt` (`expiresAt`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_createdAt` (`createdAt`);

--
-- Indexes for table `productarticletitle`
--
ALTER TABLE `productarticletitle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_article_number` (`productIndexId`,`articleNumber`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_articleNumber` (`articleNumber`);

--
-- Indexes for table `productblog`
--
ALTER TABLE `productblog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_article_blog` (`productIndexId`,`articleTitleId`,`blogId`),
  ADD KEY `reviewedBy` (`reviewedBy`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_articleTitleId` (`articleTitleId`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_generationStatus` (`generationStatus`),
  ADD KEY `idx_contentScore` (`contentScore`),
  ADD KEY `idx_seoScore` (`seoScore`);

--
-- Indexes for table `productblogpriority`
--
ALTER TABLE `productblogpriority`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_blog` (`productIndexId`,`blogId`),
  ADD KEY `idx_blogId` (`blogId`);

--
-- Indexes for table `productcategorypriority`
--
ALTER TABLE `productcategorypriority`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_category` (`productIndexId`,`categoryId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `productclick`
--
ALTER TABLE `productclick`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_productId` (`productId`),
  ADD KEY `idx_blogId` (`blogId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_clickedAt` (`clickedAt`);

--
-- Indexes for table `productindex`
--
ALTER TABLE `productindex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipshopyProductId` (`ipshopyProductId`),
  ADD KEY `idx_ipshopyProductId` (`ipshopyProductId`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_popularityScore` (`popularityScore`),
  ADD KEY `idx_adminPriority` (`adminPriority`),
  ADD KEY `idx_syncStatus` (`syncStatus`);
ALTER TABLE `productindex` ADD FULLTEXT KEY `idx_search` (`name`,`description`,`tags`);

--
-- Indexes for table `productperformance`
--
ALTER TABLE `productperformance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_blog` (`productIndexId`,`blogId`),
  ADD UNIQUE KEY `unique_product_category` (`productIndexId`,`categoryId`),
  ADD KEY `blogId` (`blogId`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `idx_productIndexId` (`productIndexId`),
  ADD KEY `idx_ctr` (`ctr`);

--
-- Indexes for table `productsynclog`
--
ALTER TABLE `productsynclog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_syncType` (`syncType`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_startedAt` (`startedAt`);

--
-- Indexes for table `settingsauditlog`
--
ALTER TABLE `settingsauditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_adminUserId` (`adminUserId`),
  ADD KEY `idx_actionType` (`actionType`),
  ADD KEY `idx_createdAt` (`createdAt`);

--
-- Indexes for table `sitesettings`
--
ALTER TABLE `sitesettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_name` (`key_name`),
  ADD KEY `idx_key_name` (`key_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `userblockedcomment`
--
ALTER TABLE `userblockedcomment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_blocked` (`userId`),
  ADD KEY `idx_userId` (`userId`),
  ADD KEY `idx_blockedBy` (`blockedBy`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adcampaign`
--
ALTER TABLE `adcampaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adclick`
--
ALTER TABLE `adclick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adimpression`
--
ALTER TABLE `adimpression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aditem`
--
ALTER TABLE `aditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admingroup`
--
ALTER TABLE `admingroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admingrouppermission`
--
ALTER TABLE `admingrouppermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminotp`
--
ALTER TABLE `adminotp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminuser`
--
ALTER TABLE `adminuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adminusergroup`
--
ALTER TABLE `adminusergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adplacement`
--
ALTER TABLE `adplacement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aiproviderconfig`
--
ALTER TABLE `aiproviderconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articlehyperlink`
--
ALTER TABLE `articlehyperlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `blogcategory`
--
ALTER TABLE `blogcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `blogevent`
--
ALTER TABLE `blogevent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bloggenerationlog`
--
ALTER TABLE `bloggenerationlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogproduct`
--
ALTER TABLE `blogproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogrelation`
--
ALTER TABLE `blogrelation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contentvalidationrule`
--
ALTER TABLE `contentvalidationrule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generationcost`
--
ALTER TABLE `generationcost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generationexclusion`
--
ALTER TABLE `generationexclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generationqueue`
--
ALTER TABLE `generationqueue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generationsettings`
--
ALTER TABLE `generationsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informationprivacypolicy`
--
ALTER TABLE `informationprivacypolicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passwordresettoken`
--
ALTER TABLE `passwordresettoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productarticletitle`
--
ALTER TABLE `productarticletitle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productblog`
--
ALTER TABLE `productblog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productblogpriority`
--
ALTER TABLE `productblogpriority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcategorypriority`
--
ALTER TABLE `productcategorypriority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productclick`
--
ALTER TABLE `productclick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productindex`
--
ALTER TABLE `productindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productperformance`
--
ALTER TABLE `productperformance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productsynclog`
--
ALTER TABLE `productsynclog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settingsauditlog`
--
ALTER TABLE `settingsauditlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitesettings`
--
ALTER TABLE `sitesettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userblockedcomment`
--
ALTER TABLE `userblockedcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `adclick`
--
ALTER TABLE `adclick`
  ADD CONSTRAINT `adclick_ibfk_1` FOREIGN KEY (`adItemId`) REFERENCES `aditem` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adclick_ibfk_2` FOREIGN KEY (`campaignId`) REFERENCES `adcampaign` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adclick_ibfk_3` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adclick_ibfk_4` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adclick_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `adimpression`
--
ALTER TABLE `adimpression`
  ADD CONSTRAINT `adimpression_ibfk_1` FOREIGN KEY (`adItemId`) REFERENCES `aditem` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adimpression_ibfk_2` FOREIGN KEY (`campaignId`) REFERENCES `adcampaign` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adimpression_ibfk_3` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adimpression_ibfk_4` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `adimpression_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `aditem`
--
ALTER TABLE `aditem`
  ADD CONSTRAINT `aditem_ibfk_1` FOREIGN KEY (`campaignId`) REFERENCES `adcampaign` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `aditem_ibfk_2` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admingrouppermission`
--
ALTER TABLE `admingrouppermission`
  ADD CONSTRAINT `admingrouppermission_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `admingroup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `adminusergroup`
--
ALTER TABLE `adminusergroup`
  ADD CONSTRAINT `adminusergroup_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `adminusergroup_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `admingroup` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `adplacement`
--
ALTER TABLE `adplacement`
  ADD CONSTRAINT `adplacement_ibfk_1` FOREIGN KEY (`campaignId`) REFERENCES `adcampaign` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `aiproviderconfig`
--
ALTER TABLE `aiproviderconfig`
  ADD CONSTRAINT `aiproviderconfig_ibfk_1` FOREIGN KEY (`updatedBy`) REFERENCES `adminuser` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `articlehyperlink`
--
ALTER TABLE `articlehyperlink`
  ADD CONSTRAINT `articlehyperlink_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `adminuser` (`id`);

--
-- Constraints for table `blogcategory`
--
ALTER TABLE `blogcategory`
  ADD CONSTRAINT `blogcategory_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogcategory_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogevent`
--
ALTER TABLE `blogevent`
  ADD CONSTRAINT `blogevent_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogevent_ibfk_2` FOREIGN KEY (`eventId`) REFERENCES `event` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bloggenerationlog`
--
ALTER TABLE `bloggenerationlog`
  ADD CONSTRAINT `bloggenerationlog_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogproduct`
--
ALTER TABLE `blogproduct`
  ADD CONSTRAINT `blogproduct_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogproduct_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogrelation`
--
ALTER TABLE `blogrelation`
  ADD CONSTRAINT `blogrelation_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogrelation_ibfk_2` FOREIGN KEY (`relatedBlogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `generationexclusion`
--
ALTER TABLE `generationexclusion`
  ADD CONSTRAINT `generationexclusion_ibfk_1` FOREIGN KEY (`excludedBy`) REFERENCES `adminuser` (`id`);

--
-- Constraints for table `generationqueue`
--
ALTER TABLE `generationqueue`
  ADD CONSTRAINT `generationqueue_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `generationqueue_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `adminuser` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `generationsettings`
--
ALTER TABLE `generationsettings`
  ADD CONSTRAINT `generationsettings_ibfk_1` FOREIGN KEY (`updatedBy`) REFERENCES `adminuser` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `passwordresettoken`
--
ALTER TABLE `passwordresettoken`
  ADD CONSTRAINT `passwordresettoken_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productarticletitle`
--
ALTER TABLE `productarticletitle`
  ADD CONSTRAINT `productarticletitle_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productblog`
--
ALTER TABLE `productblog`
  ADD CONSTRAINT `productblog_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productblog_ibfk_2` FOREIGN KEY (`articleTitleId`) REFERENCES `productarticletitle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productblog_ibfk_3` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productblog_ibfk_4` FOREIGN KEY (`reviewedBy`) REFERENCES `adminuser` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `productblogpriority`
--
ALTER TABLE `productblogpriority`
  ADD CONSTRAINT `productblogpriority_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productblogpriority_ibfk_2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productcategorypriority`
--
ALTER TABLE `productcategorypriority`
  ADD CONSTRAINT `productcategorypriority_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productcategorypriority_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productclick`
--
ALTER TABLE `productclick`
  ADD CONSTRAINT `productclick_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productclick_ibfk_2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productclick_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `productperformance`
--
ALTER TABLE `productperformance`
  ADD CONSTRAINT `productperformance_ibfk_1` FOREIGN KEY (`productIndexId`) REFERENCES `productindex` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productperformance_ibfk_2` FOREIGN KEY (`blogId`) REFERENCES `blog` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `productperformance_ibfk_3` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `settingsauditlog`
--
ALTER TABLE `settingsauditlog`
  ADD CONSTRAINT `settingsauditlog_ibfk_1` FOREIGN KEY (`adminUserId`) REFERENCES `adminuser` (`id`);

--
-- Constraints for table `userblockedcomment`
--
ALTER TABLE `userblockedcomment`
  ADD CONSTRAINT `userblockedcomment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userblockedcomment_ibfk_2` FOREIGN KEY (`blockedBy`) REFERENCES `adminuser` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
