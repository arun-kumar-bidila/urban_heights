import { Router } from "express";
import adminAuthRouter from "../modules/admin/admin.auth.routes.ts";
import apartmentRouter from "../modules/apartment/apartment.auth.routes.ts";
import announcementRouter from "../modules/announcements/announcements.routes.ts";
import roomRouter from "../modules/room/room.routes.ts";
import tenantRouter from "../modules/tenant/tenant.routes.ts";

const router = Router();

router.use("/admin", adminAuthRouter);
router.use("/apartment", apartmentRouter);
router.use("/announcement", announcementRouter);
router.use("/room", roomRouter);
router.use("/tenant", tenantRouter);

export default router;
