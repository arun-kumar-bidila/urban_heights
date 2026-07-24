import { Router } from "express";
import { validator } from "../../middlewares/validator.ts";
import {
  changeRoomSchema,
  createTenantSchema,
  loginTenantSchema,
} from "./tenant.validation.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import {
  changeRoomController,
  createTenantController,
  loginTenantController,
} from "./tenant.controller.ts";
import { changeRoom } from "./tenant.service.ts";

const router = Router();

router.post(
  "/create",
  validator(createTenantSchema),
  authMiddleware,
  createTenantController,
);

router.post("/login", validator(loginTenantSchema), loginTenantController);

router.patch(
  "/change-room",
  validator(changeRoomSchema),
  authMiddleware,
  changeRoomController,
);

const tenantRouter = router;

export default tenantRouter;
