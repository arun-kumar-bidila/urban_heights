import { Router } from "express";
import adminAuthRouter from "../modules/admin/admin.auth.routes.ts";
import apartmentRouter from "../modules/apartment/apartment.auth.routes.ts";

const router = Router();

router.use("/admin", adminAuthRouter);
router.use("/apartment", apartmentRouter);

export default router;
