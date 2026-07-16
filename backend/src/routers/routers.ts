import { Router } from "express";
import adminAuthRouter from "../modules/admin/admin.auth.routes.ts";
import apartmentRouter from "../modules/apartment/apartment.auth.routes.ts";
import announcementRouter from "../modules/announcements/announcements.routes.ts";

const router = Router();

router.use("/admin", adminAuthRouter);
router.use("/apartment", apartmentRouter);
router.use("/announcement", announcementRouter);

export default router;
