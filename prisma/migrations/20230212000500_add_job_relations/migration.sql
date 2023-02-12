-- AlterTable
ALTER TABLE `build_files` ADD COLUMN `job_ID` INTEGER NULL;

-- AlterTable
ALTER TABLE `cad_files` ADD COLUMN `job_ID` INTEGER NULL;

-- AlterTable
ALTER TABLE `scan_metric` ADD COLUMN `job_ID` INTEGER NULL;

-- AlterTable
ALTER TABLE `scan_raw` ADD COLUMN `job_ID` INTEGER NULL;

-- AlterTable
ALTER TABLE `scan_result` ADD COLUMN `job_ID` INTEGER NULL;

-- AlterTable
ALTER TABLE `slice_files` ADD COLUMN `job_ID` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `build_files` ADD CONSTRAINT `build_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cad_files` ADD CONSTRAINT `cad_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_metric` ADD CONSTRAINT `scan_metric_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_raw` ADD CONSTRAINT `scan_raw_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_result` ADD CONSTRAINT `scan_result_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `slice_files` ADD CONSTRAINT `slice_files_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
