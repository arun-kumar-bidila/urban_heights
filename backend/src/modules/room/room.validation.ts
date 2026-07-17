import Joi from "joi";

export const createRoomSchema = Joi.object({
  roomNumber: Joi.string().trim().required().messages({
    "string.empty": "roomNumber is required",
    "any.required": "roomNumber is required",
  }),
  roomType: Joi.string().trim().required().messages({
    "string.empty": "roomType is required",
    "any.required": "roomType is required",
  }),
  rent: Joi.number().required().messages({
    "number.empty": "rent is required",
    "any.required": "rent is required",
  }),
}).strict();
