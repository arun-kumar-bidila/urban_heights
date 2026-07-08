import { Router } from "express";
import { registerAdminController } from "./admin.auth.controller.ts";

const router = Router();

router.post("/register", registerAdminController);

const adminAuthRouter = router;

export default adminAuthRouter;
