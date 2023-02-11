-- CreateTable
CREATE TABLE `build_files` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `slice_file_ID` INTEGER NULL,
    `file_name` VARCHAR(45) NULL,
    `blob_name` VARCHAR(45) NULL,
    `container` VARCHAR(45) NULL,
    `upload_time` DATETIME(0) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cad_files` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `parent_CAD_ID` INTEGER NULL,
    `file_name` VARCHAR(45) NULL,
    `container` VARCHAR(45) NULL,
    `upload_time` DATETIME(0) NULL,
    `blob_name` VARCHAR(45) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contract` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_ID` INTEGER NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    `gov_not_comm` TINYINT NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_parts` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_ID` INTEGER NULL,
    `CAD_file_ID` INTEGER NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_ID` INTEGER NULL,
    `name` VARCHAR(45) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `run` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `influx_UUID` BIGINT UNSIGNED NULL,
    `job_ID` INTEGER NULL,
    `configuration` VARCHAR(15) NULL,
    `build_file_ID` INTEGER NULL,
    `start_time` DATETIME(0) NULL,
    `end_time` DATETIME(0) NULL,
    `operator_ID` INTEGER NULL,
    `cell_ID` INTEGER NULL,
    `status` VARCHAR(15) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `scan_metric` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `scan_ID` INTEGER NULL,
    `container` VARCHAR(45) NULL,
    `zmetric_file_name` VARCHAR(45) NULL,
    `zmetric_upload_time` DATETIME(0) NULL,
    `proximity_file_name` VARCHAR(45) NULL,
    `proximity_upload_time` DATETIME(0) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `scan_raw` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `run_ID` INTEGER NULL,
    `cell_ID` INTEGER NULL,
    `operator_ID` INTEGER NULL,
    `container` VARCHAR(45) NULL,
    `scan_file_name` VARCHAR(45) NULL,
    `scan_blob_name` VARCHAR(45) NULL,
    `scan_upload_time` DATETIME(0) NULL,
    `rsi_file_name` VARCHAR(45) NULL,
    `rsi_blob_name` VARCHAR(45) NULL,
    `rsi_upload_time` DATETIME(0) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `scan_result` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `scan_ID` INTEGER NULL,
    `container` VARCHAR(45) NULL,
    `mesh_file_name` VARCHAR(45) NULL,
    `mesh_blob_name` VARCHAR(45) NULL,
    `mesh_upload_time` DATETIME(0) NULL,
    `ptcloud_file_name` VARCHAR(45) NULL,
    `ptcloud_blob_name` VARCHAR(45) NULL,
    `ptcloud_upload_time` DATETIME(0) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `slice_files` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `CAD_file_ID` INTEGER NULL,
    `file_name` VARCHAR(45) NULL,
    `blob_name` VARCHAR(45) NULL,
    `container` VARCHAR(45) NULL,
    `upload_time` DATETIME(0) NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
