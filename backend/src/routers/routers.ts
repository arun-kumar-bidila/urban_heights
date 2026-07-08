import { Router } from "express";
import adminAuthRouter from "../modules/admin/admin.auth.routes.ts";

const router = Router();

router.use("/admin", adminAuthRouter);

export default router;
