import { Router } from "express";

import { createRoomSchema } from "./room.validation.ts";
import { validator } from "../../middlewares/validator.ts";
import { authMiddleware } from "../../middlewares/auth.middleware.ts";
import {
  createRoomController,
  fetchRoomsController,
} from "./room.controller.ts";

const router = Router();

router.post(
  "/create",
  validator(createRoomSchema),
  authMiddleware,
  createRoomController,
);
router.get("/fetch", authMiddleware, fetchRoomsController);

const roomRouter = router;

export default roomRouter;
