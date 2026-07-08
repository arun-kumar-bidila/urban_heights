import type { Request, Response, NextFunction } from "express";
import type { ObjectSchema } from "joi";

export const validator =
  (schema: ObjectSchema) =>
  (req: Request, res: Response, next: NextFunction) => {
    const { error, value } = schema.validate(req["body"]);

    if (error) {
      next(error);
    }
    req["body"] = value;

    next();
  };
