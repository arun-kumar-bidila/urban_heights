import { Router } from "express";
import { validator } from "../../middlewares/validator.ts";
import { createTenantSchema } from "./tenant.validation.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import { createTenantController } from "./tenant.controller.ts";

const router = Router();

router.post(
  "/create",
  validator(createTenantSchema),
  authMiddleware,
  createTenantController,
);

const tenantRouter = router;

export default tenantRouter;
