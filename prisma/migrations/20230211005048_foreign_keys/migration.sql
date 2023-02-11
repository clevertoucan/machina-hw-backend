-- AddForeignKey
ALTER TABLE `build_files` ADD CONSTRAINT `build_files_slice_file_ID_fkey` FOREIGN KEY (`slice_file_ID`) REFERENCES `slice_files`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cad_files` ADD CONSTRAINT `cad_files_parent_CAD_ID_fkey` FOREIGN KEY (`parent_CAD_ID`) REFERENCES `cad_files`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contract` ADD CONSTRAINT `contract_customer_ID_fkey` FOREIGN KEY (`customer_ID`) REFERENCES `customer`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_parts` ADD CONSTRAINT `customer_parts_customer_ID_fkey` FOREIGN KEY (`customer_ID`) REFERENCES `customer`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_parts` ADD CONSTRAINT `customer_parts_CAD_file_ID_fkey` FOREIGN KEY (`CAD_file_ID`) REFERENCES `cad_files`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `job` ADD CONSTRAINT `job_contract_ID_fkey` FOREIGN KEY (`contract_ID`) REFERENCES `contract`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `run` ADD CONSTRAINT `run_job_ID_fkey` FOREIGN KEY (`job_ID`) REFERENCES `job`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `run` ADD CONSTRAINT `run_build_file_ID_fkey` FOREIGN KEY (`build_file_ID`) REFERENCES `build_files`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_metric` ADD CONSTRAINT `scan_metric_scan_ID_fkey` FOREIGN KEY (`scan_ID`) REFERENCES `scan_raw`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_raw` ADD CONSTRAINT `scan_raw_run_ID_fkey` FOREIGN KEY (`run_ID`) REFERENCES `run`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `scan_result` ADD CONSTRAINT `scan_result_scan_ID_fkey` FOREIGN KEY (`scan_ID`) REFERENCES `scan_raw`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `slice_files` ADD CONSTRAINT `slice_files_CAD_file_ID_fkey` FOREIGN KEY (`CAD_file_ID`) REFERENCES `cad_files`(`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
